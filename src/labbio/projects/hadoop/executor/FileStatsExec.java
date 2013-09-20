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

import java.io.File;

import labbio.projects.hadoop.file.stats.FileStats;
import labbio.projects.hadoop.sampler.Sampler;
import labbio.projects.hadoop.sampler.impl.ClusterSampler;
import labbio.projects.hadoop.sampler.impl.SystematicSampler;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.ToolRunner;

/**
 * @author renatomarroquin
 */
public class FileStatsExec {

	/**
	 * Array containing the file names to be checked.
	 */
	public String[] fileNames;
	
	/**
	 * Path where the files are.
	 */
	private String dataPath;
	
	/**
	 * Default data files' location.
	 */
	public static String HDFS_DATA_LOCATION = "pigData/";
	public static String LOCAL_DATA_LOCATION = "/mnt/tpcDS/data/";
	public static String DATA_LOCATION;
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			if(args[0].equals("true")){
				DATA_LOCATION = HDFS_DATA_LOCATION;
			}
			else if (args[0].equals("false")){
				DATA_LOCATION = LOCAL_DATA_LOCATION;
			}
			
			Path pathR = new Path(HDFS_DATA_LOCATION + "call_center.dat");
			TextInputFormat inf = new TextInputFormat();
			ClusterSampler objSamplerR = new ClusterSampler(pathR, 0.1,Integer.MAX_VALUE,1);
	        
			String []execMode = {"false"};
	        
			if(ToolRunner.run(objSamplerR,execMode)!=0) System.out.println("dio mierda");
			objSamplerR.getSample();
		        
		    FileStats R1FileStats = new FileStats(pathR, inf, objSamplerR.getJobObj());
		    double d = R1FileStats.getApproxCardinality();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	/**
	 * Method to get the file names within the data path specified. 
	 */
	public void getFileNames(){
		
		File fo = new File(LOCAL_DATA_LOCATION);
		if(fo.isDirectory())
			this.fileNames = fo.list();
		
	}
	
}
