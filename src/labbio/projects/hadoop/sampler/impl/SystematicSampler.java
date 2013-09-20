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

import labbio.projects.hadoop.executor.LocalInputSamplerExec;
import labbio.projects.hadoop.file.stats.FileStats;
import labbio.projects.hadoop.sampler.Sampler;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.InputFormat;
import org.apache.hadoop.mapreduce.InputSplit;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.RecordReader;
import org.apache.hadoop.mapreduce.TaskAttemptContext;
import org.apache.hadoop.mapreduce.TaskAttemptID;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.StringUtils;
import org.apache.hadoop.util.Tool;

/**
 * Start with a relation R with cardinality N whose tuples
 * can be accessed in ascending/descending order on the
 * join attribute(s) of R; decide on the size n of the sample 
 * relation; to produce the sample relation, select a tuple
 * at random from the first k = floor(N,n) tuples of R and
 * every kth tuple thereafter.
 * 
 * @author rmogrovejo
 *
 */
public class SystematicSampler extends Configured implements Tool, Sampler{
	
	/**
     * number of samples that will be taken, expressed as a percentage of the whole file.
     */
	private double percentSampled;
	private static double DEFAULT_PERCENT_SAMPLED = 0.01;
	/**
     * number of samples that will be taken.
     */
	private long numSamples;
	private final int maxSplitsSampled;
	private long inputSize;
	private long firstRecordSize;
	
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
     * Create a new SystematicSampler with default values.
     * @param pSampleFilePath	file path to sample
     */
    public SystematicSampler(Path pSampleFilePath){
    	this(pSampleFilePath, DEFAULT_PERCENT_SAMPLED, Integer.MAX_VALUE, DEFAULT_COLUMN_SAMPLED);
    }
	/**
	 * Create a new SystematicSampler sampling all splits.
	 * This will read every split at the client, which is very expensive.
	 * @param percentSampledParam Percentage of input file that will be sampled.
	 * @param pSampleFilePath	file path to sample
	 */
	public SystematicSampler(Path pSampleFilePath, double pPercentSampled) {
		this(pSampleFilePath, pPercentSampled, Integer.MAX_VALUE, DEFAULT_COLUMN_SAMPLED);
	}
	
	/**
	 * Create a new SystematicSampler.
	 * @param pSampleFilePath		file path to sample
	 * @param percentSampledParam	percentage of rows to be sampled.
	 * @param maxSplitsSampled		The maximum number of splits to examine. Default Integer.MAX_VALUE.
	 * @param pColSampled			column to be sampled.
	 */
	public SystematicSampler(Path pSampleFilePath, double pPercentSampled, int maxSplitsSampled, int pColSampled) {
		this.setColumnSampled(pColSampled);
		this.setFilePath(pSampleFilePath);
		this.percentSampled = pPercentSampled;
	    this.maxSplitsSampled = maxSplitsSampled;
	}
	
	/**
	 * @return the number of rows to be sampled based on the percentage set.
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public void setNumSamples() throws IOException, InterruptedException{
		FileStats fileStatR = new FileStats(this.getFilePath(),new TextInputFormat(),this.job);
		double fileApproxCard = fileStatR.getApproxCardinality();
		this.numSamples = (long) Math.min(Math.ceil(fileApproxCard * percentSampled),fileApproxCard - fileApproxCard*MAX_SAMPLING_CONST);
	}
	/**
	 * The number of total samples to be taken out of the relation will be
	 * divided among all the splits, in this way we will be sure to take
	 * almost the same number of samples for each split. 
	 */
	@Override
	public Object[] getSample() {
		
		try {
			
			// Setting the number of samples to be taken.
			setNumSamples();
			TextInputFormat inf = new TextInputFormat();
			List splits = inf.getSplits(job);
			
			// TODO: if the percentage to be sampled is way too big, the arrayList will not work.
		    ArrayList samples = new ArrayList();
		    FileStats fileStatsR = new FileStats(filePath,inf,job);
		    
		    int splitsToSample = Math.min(maxSplitsSampled, splits.size());
		    long samplesBySplit = this.numSamples / splits.size();
		    long extraSamples = this.numSamples % splits.size();
		    
		    // TO GET RANDOM VALUES
		    Random r = new Random();
		    long seed = r.nextLong();
		    r.setSeed(seed);
		    
		    // Choosing a K to work inside of all splits.
		    // Split size 0 is used because it should be the biggest, the last one could be the smallest 
		    //double approxSplitRowNum = ((InputSplit)splits.get(0)).getLength()/fileStatsR.getFirstRecordSize();
		    double approxSplitRowNum = fileStatsR.getApproxCardinalityBySplit(0);
	        int firstKElemsSplit = (int)Math.ceil(approxSplitRowNum/samplesBySplit+extraSamples);
	        
	        // TODO There are two conditions that have to be taken into consideration K = ceil(|R1|/m)
	        //////// One when K = |R1|/m  ->  yTh tuple = (y+K)
	        //////// Another when K > |R1|/m -> yTh tuple is the yTh tuple until the (y+(m-2)*K) 
	        //////// 	and a tuple randomly  chosen among the (y + (m-1)*K) ... |R1| 
		    for (int i = 0; i < splitsToSample || (i < splits.size() && samples.size() < numSamples); ++i) {
		    	
		    	TaskAttemptContext samplingContext = new TaskAttemptContext(job.getConfiguration(), new TaskAttemptID());
		        RecordReader reader = inf.createRecordReader(((InputSplit)splits.get(i)), samplingContext);
		        reader.initialize(((InputSplit)splits.get(i)), samplingContext);
		        
		        int j = r.nextInt(firstKElemsSplit);
		        int recordCnt = 0;
		        
		    	while (reader.nextKeyValue()) {
		    		
		    		if ((recordCnt == j) && (samples.size() < numSamples)) {
		    			String valueSampled = getValueFromLine(reader.getCurrentValue().toString());
		    			samples.add(valueSampled);
		    		}
		    		
		    		recordCnt++;
		    		
		    		if (recordCnt == firstKElemsSplit){
		    			recordCnt = 0;
		    			j = r.nextInt(firstKElemsSplit);
		    		}
		    		
		    	}
		    	reader.close();
		    }
		    
		    return (Object[])samples.toArray();
		    
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
		
	@Override
	public String getValueFromLine(String line) {
		int colSampled = getColumnSampled();
		char colSeparator = getColumnSeparator();
		String[] parts = StringUtils.split(line.trim(), StringUtils.ESCAPE_CHAR,colSeparator);
		String value = "";
		
		if (colSampled <= parts.length)
			value = parts[colSampled-1];
		
		return value;
	}

	@Override
	public void configureJob(Configuration pConf, String pExecMode) {
		if ( pExecMode.equals("true") ) {
			pConf.set("fs.default.name", "file:///");
			pConf.set("mapred.job.tracker", "local");
		}
		else{
			pConf.set("fs.default.name", FS_DEFAULT_NAME);
			pConf.set("mapred.job.tracker", DEFAULT_JOB_TRACKER);
		}
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
	public Job getJobObj(){
		return this.job;
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
