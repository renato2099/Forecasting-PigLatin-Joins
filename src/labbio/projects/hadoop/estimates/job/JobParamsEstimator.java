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
package labbio.projects.hadoop.estimates.job;

import java.io.IOException;

import labbio.projects.hadoop.file.stats.FileStats;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;

/**
 * @author renatomarroquin
 */
public class JobParamsEstimator {


	/**
	 * array containing the list of paths that will be
	 * processed by any job
	 */
	private static Path pathList[];
	
	/** 
     * Configuration object.
     */
	private static Configuration conf;
	
	/**
	 * Default file system URI
	 */
	public static String FS_DEFAULT_NAME = "hdfs://berlin.labbio:54310";
	
	/**
	 * Default job tracker. 
	 */
	public static String DEFAULT_JOB_TRACKER = "berlin.labbio:54311";
	
	//TODO these variables can be obtained from the environment
	/**
	 * *********** based on PIG-1249 ************
	 * Default number of bytes for reducer. 
	 * pig.exec.reducers.bytes.per.reducer -> 1GB = 1000 * 1000 * 1000
	 */
	private static long BYTES_FOR_REDUCER = (long)250 * 1000 * 1000;
	
	/**
	 * *********** based on PIG-1249 ************
	 * Default max number of reducers
	 * pig.exec.reducers.max -> 999;
	 */
	private static int MAX_REDUCERS = 999;
	
	/**
	 * Default initializer. Makes the string list into paths and
	 * configures the environment where the method will be executed.
	 * @param execMode	if this is local or in a cluster
	 * @param pPathList	list of paths that will be processed
	 */
	public static void initializer(String execMode, String pPathList[]){
		
		pathList = new Path[pPathList.length];
		
		for(int iCnt = 0; iCnt < pPathList.length; iCnt++)
			pathList[iCnt] = new Path(pPathList[iCnt]);
		
		conf = new Configuration();
		if ( execMode.equals("true") ) {
			conf.set("fs.default.name", "file:///");
			conf.set("mapred.job.tracker", "local");
		}
		else{
			conf.set("fs.default.name", FS_DEFAULT_NAME);
			conf.set("mapred.job.tracker", DEFAULT_JOB_TRACKER);
		}
	}
	
	/**
	 * Method to process all file involved and obtain their length.
	 * @return	total input bytes of all files involved
	 */
    public static long getTotalInputBytes(){
    	
    	//FileSystem fs = FileSystem.get(URI.create(uri), conf);
    	long acum = 0;
    	String fileName = "";
    	try {
	    	for(Path objPath : pathList){
	    		FileSystem fs = FileSystem.get(objPath.toUri(), conf);
	    		fileName = objPath.getName();
				acum += fs.getFileStatus(objPath).getLen();
	    	}
    	} catch (IOException e) {
			// TODO Auto-generated catch block
    		acum = -1;
    		System.out.println("Error reading file while getting total InputBytes" + fileName);
			e.printStackTrace();
		}
    	
    	return acum;
    	
//    	InputStream in = null;
//    	try {
//    	  in = fs.getopen(new Path(uri));
//    	  IOUtils.copyBytes(in, System.out, 4096, false);
//    	} finally {
//    	  IOUtils.closeStream(in);
//    	}

    }
    public static long getTotalInputRecords(){
    	
    	long totInputRecs = 0;
    	
    	try {
    	
    		TextInputFormat inf = new TextInputFormat();
	    	for(int iCnt = 0; iCnt < pathList.length; iCnt ++){
	    		Job job = new Job(conf, "JpEstim");
	    		
	    		TextInputFormat.addInputPath(job, pathList[iCnt]);
				FileStats objFileStats = new FileStats(pathList[iCnt], inf, job);
				FileSystem fs = FileSystem.get(pathList[iCnt].toUri(), conf);
				totInputRecs += objFileStats.getApproxCardinality();
	    	}
	    	
    	} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	return totInputRecs;
    }
    /**
     * Method to estimate the number of mappers needed <br>
     * Example:
     * Thus, if you expect 10TB of input data and have 128MB DFS blocks, you
     * will end up with 82k maps, unless your mapred.map.tasks is even larger.
     *  
     * @return estimated number of mappers needed for the process. 
     */
    public static long estimateNumberOfMappers(){
        return (long)Math.max(1, Math.ceil(getTotalInputBytes()/getBlockSize()));
    }
   
    /**
     * Method to obtain the block size. All files are in the 
     * same system, therefore they have the same block size.
     * 
     * @return	the system's block size
     */
    public static long getBlockSize(){
    	// block size is the same for the whole system, so 
    	// it doesn't matter which file we decide to use
        long blockSize = -1;
    	String fileName = "";
    	try {
	    	FileSystem fs = FileSystem.get(pathList[0].toUri(), conf);
	    	fileName = pathList[0].getName();
	    	blockSize = fs.getFileStatus(pathList[0]).getBlockSize();
	    	
    	} catch (IOException e) {
			// TODO Auto-generated catch block
    		System.out.println("Error reading file while getting total InputBytes" + fileName);
			e.printStackTrace();
		}
    	return blockSize;
    }

    //
    /**
     * Currently the estimation of reducer number is only applied to HDFS, The estimation is based on the input size of data storage on HDFS.
     * Two parameters can been configured for the estimation, one is pig.exec.reducers.max which constrain the maximum number of reducer task (default is 999). The other
     * is pig.exec.reducers.bytes.per.reducer(default value is 1000*1000*1000) which means the how much data can been handled for each reducer.
     * e.g. the following is your pig script
     * a = load '/data/a';
     * b = load '/data/b';
     * c = join a by $0, b by $0;
     * store c into '/tmp';
     * 
     * The size of /data/a is 1000*1000*1000, and size of /data/b is 2*1000*1000*1000.
     * Then the estimated reducer number is (1000*1000*1000+2*1000*1000*1000)/(1000*1000*1000)=3
     *
     * @param conf
     * @param lds
     * @throws IOException
     */
     public static int estimateNumberOfReducers(){
      	// we are using the defaults
      	// pig.exec.reducers.bytes.per.reducer 1000 * 1000 * 1000
        long totalInputFileSize = getTotalInputBytes();

        //log.info("BytesPerReducer=" + bytesPerReducer + " maxReducers="
        //+ maxReducers + " totalInputFileSize=" + totalInputFileSize);
         
        int reducers = (int)Math.ceil((totalInputFileSize+0.0) / BYTES_FOR_REDUCER);
        reducers = Math.max(1, reducers);
        reducers = Math.min(MAX_REDUCERS, reducers);
         
        return reducers;
    }
}
