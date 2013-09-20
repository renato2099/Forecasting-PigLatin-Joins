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
package labbio.projects.hadoop.executor;

import labbio.projects.hadoop.sampler.Sampler;
import labbio.projects.hadoop.sampler.impl.ClusterSampler;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.log4j.Logger;

/**
 * @author renatomarroquin
 */
public class LocalInputSamplerExec extends Configured implements Tool {

	protected static Logger logger = Logger.getLogger(LocalInputSamplerExec.class);
	private static char COLUMN_SEPARATOR = '|';
	private static int COLUMN_SAMPLED = 0;
	//pigData/call_center.dat 1000 10 true 1
	
	public static void main(String [] args) throws Exception{
		
		int returnCode = ToolRunner.run(new LocalInputSamplerExec(), args);
		System.out.println(args.toString());
		System.exit(returnCode);
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
        
        if (0 >= maxSplits) maxSplits = Integer.MAX_VALUE;
        //Sampler sampler = new IntervalSampler(numSamples, maxSplits);
        //Sampler sampler = new RandomSampler(numSamples, 5, maxSplits);
        //Sampler sampler = new SystematicSampler(numSamples, maxSplits);
        Sampler sampler = new ClusterSampler(new Path(arg0[0]), 0.0001);
        ((ClusterSampler)sampler).setColumnSampled(Integer.parseInt(arg0[4]));
        
        FileInputFormat.addInputPath(job, new Path(arg0[0]));
        TextInputFormat fileInFormat = new TextInputFormat();

        job.setJarByClass(LocalInputSamplerExec.class);
	    job.setInputFormatClass(TextInputFormat.class);
	    job.setMapOutputKeyClass(TextInputFormat.class);
	    
        Object[] samplesArray = sampler.getSample();
        for(Object o: samplesArray){
        	System.out.println(o.toString());
        }
        
		return 0;
	}

	/**
	 * @param COLUMN_SAMPLED the COLUMN_SAMPLED to set
	 */
	public static void setColSampled(int cOLUMN_SAMPLED) {
		COLUMN_SAMPLED = cOLUMN_SAMPLED;
	}

	/**
	 * @return the cOLUMN_SAMPLED
	 */
	public static int getColSampled() {
		return COLUMN_SAMPLED;
	}

	/**
	 * @param cOLUMN_SEPARATOR the cOLUMN_SEPARATOR to set
	 */
	public static void setColSep(char cOLUMN_SEPARATOR) {
		COLUMN_SEPARATOR = cOLUMN_SEPARATOR;
	}

	/**
	 * @return the cOLUMN_SEPARATOR
	 */
	public static char getColSep() {
		return COLUMN_SEPARATOR;
	}

}
