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
package labbio.projects.hadoop.sampler;

import java.io.IOException;

import labbio.projects.hadoop.estimates.join.QzJoinEstimate;
import labbio.projects.hadoop.executor.JoinEstimateExec;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.InputFormat;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.StringUtils;
import org.apache.hadoop.util.Tool;


/**
 * All the types of samplers will implement this interface
 * 
 * @author rmogrovejo
 */
public interface Sampler {
	
    /**
     * Default column separator.
     */
	public char DEFAULT_COLUMN_SEPARATOR = '|';
    
    /**
     * Default column to be sampled.
     */
	public final int DEFAULT_COLUMN_SAMPLED = 1;
	
    /**
     * Max sampling constraint to avoid sampling more than the actual rows we have.
     */
	public double MAX_SAMPLING_CONST = 0.1;
    
	/**
	 * Default file system URI
	 */
	public String FS_DEFAULT_NAME = "hdfs://berlin.labbio:54310";
	
	/**
	 * Default job tracker. 
	 */
	public String DEFAULT_JOB_TRACKER = "berlin.labbio:54311";
	/**
	 * For a given job, collect and return a subset of the keys from the
	 * input data.
	 */
	//TODO: This should return a generic type
    public abstract Object[] getSample();
	
	/**
	 * Method to obtain the specific value from the line being checked.
	 * @param line	a line of the file representing a tuple.
	 * @return		the specific field.
	 */
	//TODO: This should accept a generic type
	public abstract String getValueFromLine(String line);
	
	/**
	 * Method to configure the job that will be executed.
	 * @param pConf		Configuration object.
	 * @param pExecMode	Execution mode 'true' for local and 'false' for distributed mode.
	 */
	public abstract void configureJob(Configuration pConf, String pExecMode);

	public abstract Job getJobObj();
//	/**
//	 * Method to get the column separator.
//	 */
//	public char getColumnSeparator(){
//		return DEFAULT_COLUMN_SEPARATOR;
//	}
//	
//	/**
//	 * Method to get the index of the column sampled.
//	 */
//	public int getColumnSampled(){
//		return DEFAULT_COLUMN_SAMPLED;
//	}
//	
//	/**
//	 * Method to change the default column separator.
//	 * @param pColumnSeparator	character that works as column separator
//	 */
//	public void setColumnSeparator(char pColumnSeparator){
//		DEFAULT_COLUMN_SEPARATOR = pColumnSeparator;
//	}
//	
//	
//	public void configureJob(Configuration pConf, String pExecMode){}
}