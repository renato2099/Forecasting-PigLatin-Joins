/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package labbio.projects.hadoop.sampler.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import labbio.projects.hadoop.executor.JoinEstimateExec;
import labbio.projects.hadoop.executor.LocalInputSamplerExec;
import labbio.projects.hadoop.file.stats.FileStats;
import labbio.projects.hadoop.sampler.Sampler;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.InputFormat;
import org.apache.hadoop.mapreduce.InputSplit;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.RecordReader;
import org.apache.hadoop.mapreduce.TaskAttemptContext;
import org.apache.hadoop.mapreduce.TaskAttemptID;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.ReflectionUtils;
import org.apache.hadoop.util.StringUtils;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

/**
 *  Based on the work by Hou et. al called: 
 *  "Statistical estimators for relational algebra expressions"
 *  In cluster sampling, when a disk page is brought into memory,
 *  all tuples on the page are sampled. This increases the efficiency,
 *  especially if 'c', the blocking factor, is large. However, the
 *  samples are no longer independent.
 *  
 *  From "Practical Selectivity Estimation through Adaptive Sampling":
 *  One natural way to incorporate this into their sampling framwork is
 *  as follows: First, define a sample to be a randomly chosen disk page
 *  of the relation, rather than a randomly chosen tuple. The size of a 
 *  sample is the number of tuples in the page that satisfy the selection,
 *  and 'n', the number of partitions, is the number of disk blocks in the
 *  relation -> treating a disk page as a single sample 
 *  
 * @author rmogrovejo
 *
 */
public class ClusterSampler extends Configured implements Tool, Sampler {

	/**
	 * The maximum number of splits to examine. There might be too many.
	 */
    private final int splitsSampled;
    
    /**
     * only sampling at most 50% of the entire relation
     */
    private final double MAX_ALLOWED_SPLITS = 0.5;
    
    /**
     * Only sampling at most 50% of each split.
     * There might not be enough memory to hold not even 50% of the half of the total number of splits. 
     */
    private final double MAX_TUPLES_BY_SPLITS = 0.5;
    
    /**
     * number of samples that will be taken, expressed as a percentage of the whole file.
     */
    private final double percentSampled;
    
    /**
     * number of samples that will be taken.
     */
	private long numSamples;
	
	/**
     * Path of the file that will be sampled. 
     */
	public Path filePath = null;
	
	/**
     * Configuration parameters. 
     * Configuration and Job object.
     */
    private Configuration conf;
    private Job job;
    
    /**
     * Column to be sampled.
     */
    public int column_sampled;
    
    /**
     * Default class constructor.
     * @param pNumSamples		number of samples to be taken
     * @param pSampleFilePath	file path to sample
     */
    public ClusterSampler(Path pSampleFilePath, double percentSampledParam){
    	this(pSampleFilePath, percentSampledParam,Integer.MAX_VALUE, DEFAULT_COLUMN_SAMPLED);
    }
	
    /**
     * Class constructor.
     * @param pNumSamples		number of samples to be taken
     * @param pMaxSplitsSampled upper limit of partitions to be examined. Default Integer.MAX_VALUE
     * @param pSampleFilePath	file path to sample
     * @param pColSampled		column to be sampled.
     */
    public ClusterSampler(Path pSampleFilePath, double percentSampledParam, int pMaxSplitsSampled, int pColSampled){
    	this.setColumnSampled(pColSampled);
    	this.setFilePath(pSampleFilePath);
    	this.percentSampled = percentSampledParam;
    	this.splitsSampled = pMaxSplitsSampled;
    }
    
    /**
	 * @param inf Object containing the information about the input.
	 * @param job Object containing the information about the job.
	 * @return the number of rows to be sampled based on the percentage set.
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public void setNumSamples() throws IOException, InterruptedException{
		FileStats fileStatR = new FileStats(this.getFilePath(),new TextInputFormat(),this.job);
		long fileApproxCard = (long) fileStatR.getApproxCardinality();
		//// With this condition we make sure we never ask for more samples than actual rows
		this.numSamples = (long) Math.min(Math.ceil(fileApproxCard * percentSampled),fileApproxCard - fileApproxCard*MAX_SAMPLING_CONST);
	}
	
	@Override
	public Job getJobObj(){
		return this.job;
	}
	
    /**
	 * Randomize the split order, then take the specified number of keys from
	 * each split sampled, where each key is selected with the specified
	 * probability and possibly replaced by a subsequently selected key when
	 * the quota of keys from that split is satisfied.
	 */
	@Override
	public Object[] getSample(){
		
		try{
		// Setting the number of samples to be taken.
		setNumSamples();
		TextInputFormat inf = new TextInputFormat();
		List splits = inf.getSplits(job);
		
		// TODO: if the percentage to be sampled is way too big, the arrayList will not work.
	    ArrayList samples = new ArrayList();
	    FileStats fileStatsR = new FileStats(filePath,inf,job);
	    
	    // ALLOWING AT MOST 50% OF SPLITS TO BE SAMPLED.
	    int splitsToSample = (int) Math.min(splitsSampled, Math.ceil(splits.size()*MAX_ALLOWED_SPLITS));
	    //System.out.println("DEBUG " + String.valueOf(splits.size()));
	    long records = 0;
	    
	    // SHUFFLING SPLITS INSTEAD OF CHOOSING ONE RANDOMLY 
	    // TO AVOID CHOOSING THE SAME PARTITION MORE THAN ONCE
	    Random r = new Random();
	    long seed = r.nextLong();
	    r.setSeed(seed);
	    for (int i = 0; i < splits.size(); ++i) {
	    	InputSplit tmp = (InputSplit) splits.get(i);
	        int j = r.nextInt(splits.size());
	        splits.set(i, splits.get(j));
	        splits.set(j, tmp);
	    }

	    
	    for (int i = 0; i < splitsToSample; ++i) {

	    	/// read and add all data from it
	        TaskAttemptContext samplingContext = new TaskAttemptContext(job.getConfiguration(), new TaskAttemptID());
	        RecordReader reader = inf.createRecordReader(((InputSplit)splits.get(i)), samplingContext);
	        
	        reader.initialize(((InputSplit)splits.get(i)), samplingContext);
	        int maxNumberOfTupleBySplits = (int) (fileStatsR.getApproxCardinalityBySplit(i) * MAX_TUPLES_BY_SPLITS);
	        
	        records = 0;
	        while (reader.nextKeyValue()) {
	        	// If enough records have been examined then change split
	        	if (records < maxNumberOfTupleBySplits){
		        	if (samples.size() < numSamples) {
		        	//samples.add(ReflectionUtils.copy(job.getConfiguration(),reader.getCurrentKey(), null));
		        	  String valueSampled = getValueFromLine(reader.getCurrentValue().toString());
		              samples.add(valueSampled);
		            } 
		        	else {
		              // When exceeding the maximum number of samples, replace a random element with this one
		        		int ind = r.nextInt((int)numSamples);
		        		if (ind != numSamples) {
		        			String valueSampled = getValueFromLine(reader.getCurrentValue().toString());
		        			samples.set(ind,valueSampled);
		        		}
		            }
		        	// number of records examined.
			        ++records;
	        	}
	        	else
	        		break;
	        }
	    	
	        reader.close();
	      }
	      return (Object[])samples.toArray();
		}
		catch(IOException e){
			System.out.println("Error ->" + e.getMessage());
		}
		catch(InterruptedException e){
			System.out.println("Error ->" + e.getMessage());
		}
		
		return null;
	}


	@Override
	public int run(String[] arg0) throws Exception {
		
		try{
			// configure the job
			this.conf = getConf();
			this.job = new Job(conf, "Cluster Sampler");
			configureJob(conf,arg0[0]);

			FileInputFormat.addInputPath(job, this.getFilePath());
			
			this.job.setInputFormatClass(TextInputFormat.class);
			this.job.setMapOutputKeyClass(TextInputFormat.class);
			this.job.setJarByClass(ClusterSampler.class);
			
			// TODO MapReduce job for sampling should execute here
			
			return 0;
		}
		catch (Exception e){
			e.printStackTrace();
			return 1;
		}
	}
	
	@Override
	public void configureJob(Configuration pConf, String pExecMode){
//		if ( pExecMode.equals("true") ) {
//			pConf.set("fs.default.name", "file:///");
//			pConf.set("mapred.job.tracker", "local");
//		}
//		else{
			pConf.set("fs.default.name", FS_DEFAULT_NAME);
			pConf.set("mapred.job.tracker", DEFAULT_JOB_TRACKER);
//		}
	}
	
	@Override
	public String getValueFromLine(String line){
		
		int colSampled = getColumnSampled();
		char colSeparator = getColumnSeparator();
		String[] parts = StringUtils.split(line.trim(), StringUtils.ESCAPE_CHAR,colSeparator);
		String value = "";
		
		if (colSampled <= parts.length)
			value = parts[colSampled-1];
		
		return value;
	}
	
	/**
	 * Method to change the default column to be sampled.
	 * @param pColumnSampled	number of the column to be sampled.
	 */
	public void setColumnSampled(int pColumnSampled){
		column_sampled = pColumnSampled;
	}
	
	/**
	 * Method to get the index of the column sampled.
	 */
	public int getColumnSampled(){
		return column_sampled;
	}
	
	/**
	 * Method to get the column separator.
	 */
	public char getColumnSeparator(){
		return DEFAULT_COLUMN_SEPARATOR;
	}

	/**
	 * @param fILEPATH the fILEPATH to set
	 */
	protected void setFilePath(Path fILEPATH) {
		filePath = fILEPATH;
	}

	/**
	 * @return the fILEPATH
	 */
	protected Path getFilePath() {
		return filePath;
	}
}
