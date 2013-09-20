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
package labbio.projects.statistics.sampling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import org.apache.hadoop.util.StringUtils;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.log4j.Logger;

/**
 * 
 * @author renatomarroquin
 *
 */
public class LocalInputSample  extends Configured implements Tool {

	protected static Logger logger = Logger.getLogger(LocalInputSample.class);
	protected static char COLUMN_SEPARATOR = '|';
	protected static int COLUMN_SAMPLED = 0;
	
	/**
	 * All the types of samplers will implement this interface
	 * @author rmogrovejo
	 *
	 */
	public interface Sampler {
		/**
		 * For a given job, collect and return a subset of the keys from the
		 * input data.
		 */
		//TODO: This should return a generic type
		Object[] getSample(InputFormat inf, Job job) throws IOException, InterruptedException;
	}

	/**
	 * Sample from s splits at regular intervals.
	 * Useful for sorted data.
	 */
	public static class IntervalSampler implements Sampler {
	    
		/**
		 * frequency with which records will be emitted.
		 */
		private final double freq;
		
		/**
		 * The maximum number of splits to examine. There might be too many.
		 */
	    private final int maxSplitsSampled;

	    /**
	     * Create a new IntervalSampler sampling all splits.
	     * @param freq The frequency with which records will be emitted.
	     */
	    public IntervalSampler(double freq) {
	      this(freq, Integer.MAX_VALUE);
	    }

	    /**
	     * Create a new IntervalSampler.
	     * @param freq The frequency with which records will be emitted.
	     * @param maxSplitsSampled The maximum number of splits to examine.
	     * @see #getSample
	     */
	    public IntervalSampler(double freq, int maxSplitsSampled) {
	      this.freq = freq;
	      this.maxSplitsSampled = maxSplitsSampled;
	    }

	    /**
	     * For each split sampled, emit when the ratio of the number of records
	     * retained to the total record count is less than the specified
	     * frequency.
	     */
	    @SuppressWarnings("unchecked") // ArrayList::toArray doesn't preserve type
	    public Object[] getSample(InputFormat inf, Job job) throws IOException, InterruptedException {
	    	
	      List splits = inf.getSplits(job);
	      ArrayList samples = new ArrayList();
	      
	      int splitsToSample = Math.min(maxSplitsSampled, splits.size());
	      System.out.println("DEBUG" + String.valueOf(splits.size()));
	      long records = 0;
	      long kept = 0;
	      
	      for (int i = 0; i < splitsToSample; ++i) {
	    	  
	        TaskAttemptContext samplingContext = new TaskAttemptContext(job.getConfiguration(), new TaskAttemptID());
	        RecordReader reader = inf.createRecordReader(((InputSplit)splits.get(i)), samplingContext);
	        
	        reader.initialize(((InputSplit)splits.get(i)), samplingContext);
	        
	        while (reader.nextKeyValue()) {
	          ++records;
	          if ((double) kept / records < freq) {
	            //samples.add(ReflectionUtils.copy(job.getConfiguration(),reader.getCurrentKey(), null));
	        	  String valueSampled = LocalInputSample.getValueFromLine(reader.getCurrentValue().toString(),LocalInputSample.COLUMN_SAMPLED,LocalInputSample.COLUMN_SEPARATOR);
	        	  samples.add(valueSampled);
	            ++kept;
	          }
	        }
	        reader.close();
	      }
	      return (Object[])samples.toArray();
	    }
	  }
	
	
	public static void main(String [] args) throws Exception{
		
		int returnCode = ToolRunner.run(new LocalInputSample(), args);
		System.out.println(args.toString());
		System.exit(returnCode);
	}
	
	public static String getValueFromLine(String line, int colSampled, char colSeparator){
		
		String[] parts = StringUtils.split(line.trim(), StringUtils.ESCAPE_CHAR,colSeparator);
		String value = "";
		
		if (colSampled <= parts.length)
			value = parts[colSampled-1];
		
		return value;
	}
	
	@Override
	public int run(String[] arg0) throws Exception {
		
		// TODO Auto-generated method stub
		Configuration conf = getConf();
		Job job = new Job(conf,"LocalInputSampler");
		
		if ( arg0[3].equals("true") ) {
			conf.set("fs.default.name", "file:///");
			conf.set("mapred.job.tracker", "local");
		}
		else{
			conf.set("fs.default.name", "hdfs://10.87.5.102:54310");
			conf.set("mapred.job.tracker", "10.87.5.102:54311");
		}
		// frequency with which samples will be emitted
		Double numSamples = Double.parseDouble(arg0[1]);
        int maxSplits = Integer.parseInt(arg0[2]);
        LocalInputSample.COLUMN_SAMPLED = Integer.parseInt(arg0[4]);
        
        if (0 >= maxSplits) maxSplits = Integer.MAX_VALUE;
        Sampler sampler = new IntervalSampler(numSamples, maxSplits);
        
        FileInputFormat.addInputPath(job, new Path(arg0[0]));
        TextInputFormat fileInFormat = new TextInputFormat();
        
        
        job.setJarByClass(LocalInputSample.class);
	    job.setInputFormatClass(TextInputFormat.class);
	    job.setMapOutputKeyClass(TextInputFormat.class);
	  
        Object[] samplesArray = sampler.getSample(fileInFormat, job);
        for(Object o: samplesArray){
        	System.out.println(o.toString());
        }
        
		return 0;
	}

}
