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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import labbio.projects.hadoop.estimates.join.QzJoinEstimate;
import labbio.projects.hadoop.estimates.join.RawJoinEstimate;

import org.apache.hadoop.fs.Path;

/**
 * @author renatomarroquin
 */
public class JoinEstimateExec {
	/// Execution for join query7 
	/// 	/mnt/tpcDS/data/item.dat /mnt/tpcDS/data/store_sales.dat 1 3 true
	/**
	 * Default path of the list containing the jobs executed.
	 */
	public static String JOBS_EXECUTED = "/mnt/tpcDS/script/queryLst.lst";
	
	/**
	 * Default data files' location.
	 */
	public static String HDFS_DATA_LOCATION = "pigData/";
	public static String LOCAL_DATA_LOCATION = "/mnt/tpcDS/data/";
	public static String DATA_LOCATION;
	
	/**
	 * Default data file extension.
	 */
	public static String FILE_EXT = ".dat";
	
	/**
	 * Array containing estimation times;
	 */
	public static long execTimes[];
	
	/**
	 * Array containing estimation times;
	 */
	public static double approxSelectivities[];
	
	/**
	 * ArrayList containing the list of executed jobs.
	 */
	public static ArrayList<String> lstExecJobs;
	
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception  {

		// execution of join estimation for two files
		///mnt/tpcDS/data/time_dim.dat /mnt/tpcDS/data/store_sales.dat 1 1 raw true
		if(args.length == 6){
			double joinEst = 0.0;
			Date initialTime = new Date();
			joinEst = getJoinEstimate(args[0], args[1], args[2], args[3], args[4], args[5]);
			Date finishTime = new Date();
			printResult(args[0], args[1], args[2], args[3], args[4], args[5], joinEst, finishTime.getTime() - initialTime.getTime());
		}
		else if(args.length == 3){
			setApproxSelectivities(getJoinEstimate(args[0], args[1], args[2]));
			printResult(args[0], args[1], args[2]);
		}
		else{
			setApproxSelectivities(getJoinEstimate(JOBS_EXECUTED, "raw", "false"));
			printResult(JOBS_EXECUTED, "raw", "false");
		}
	}
	
	/**
	 * Method to print the result of join selectivity of the files of a list.
	 * @param pExecJobsLst	List of joined files. 
	 * @param pSampleMethod
	 * @param pExecMode
	 */
	public static void printResult(String pExecJobsLst, String pSampleMethod, String pExecMode){
		
		int iLstExecJobsSize = lstExecJobs.size();
		for(int iCnt = 0; iCnt < iLstExecJobsSize; iCnt++){
			System.out.println("Executed for:\t" + lstExecJobs.get(iCnt));
			System.out.println("Sampling Method:\t" + pSampleMethod);
			System.out.println("Execution mode: \t" + (pExecMode.equalsIgnoreCase("true")?"Locally":"Distributed"));
			System.out.println("Approx. Join Sel.:\t" + String.valueOf(approxSelectivities[iCnt]));
			System.out.println("Completion time:\t" + String.valueOf((execTimes[iCnt]+0.0)/1000.0) + " segs.\n");
		}
		
	}
	
	/**
	 * Method to print the result of join selectivity between two files.
	 * @param pRelR		Relation R path.
	 * @param pRelS 	Relation S path.
	 * @param pColR 	Column used for joining relation R.
	 * @param pColS 	Column used for joining relation S.
	 * @param pExecMode Execution mode. True -> locally. False -> distributed.
	 * @param joinEst	Approximate join selectivity.
	 * @param finishTime Time taken to calculate join selectivity.
	 */
	public static void printResult(String pRelR, String pRelS, String pColR, String pColS, String pSampleMethod, String pExecMode, double joinEst, long finishTime){
		System.out.println("Executed for Files:\t" + pRelR + "-" + pRelS);
		System.out.println("Joining columns:\t" + pColR + "-" + pColS);
		System.out.println("Sampling Method:\t" + pSampleMethod);
		System.out.println("Execution mode: \t" + (pExecMode.equalsIgnoreCase("true")?"Locally":"Distributed"));
		System.out.println("Approx. Join Sel.:\t" + String.valueOf(joinEst));
		System.out.println("Completion time:\t" + String.valueOf((finishTime+0.0)/1000.0) + " segs");
	} 
	/**
	 * @param argsPathR	path of relation R
	 * @param argsPathS	path of relation S
	 * @param argsSelR	percentage to be sampled from relation R
	 * @param argsSelS	percentage to be sampled from relation S
	 * @param argsSampler	sampler type
	 * @return		estimated join selectivity
	 * @throws Exception 
	 */
	public static double getJoinEstimate(String argsPathR, String argsPathS, String argsSelR, String argsSelS, String argsSampler, String pExecMode) throws Exception  {

		Path pPathR1 = new Path(argsPathR);
		Path pPathR2 = new Path(argsPathS);
		int pSelR = Integer.valueOf(argsSelR);
		int pSelS = Integer.valueOf(argsSelS);
		String samplerType = argsSampler;
		double est = 0;
		
		if(samplerType.equalsIgnoreCase("qz")){
			QzJoinEstimate objEstimate = new QzJoinEstimate(pPathR1, pPathR2);
			objEstimate.setColSampledR(pSelR);
			objEstimate.setColSampledS(pSelS);
			objEstimate.setExecMode(pExecMode);
			est = objEstimate.getQzJoinEstimate();
		}
		
		//Approx. Estimate is: 5.555555555555556E-5
		if(samplerType.equalsIgnoreCase("raw")){
			RawJoinEstimate objEstimate = new RawJoinEstimate(pPathR1, pPathR2, 0.4);
			objEstimate.setColSampledR(pSelR);
			objEstimate.setColSampledS(pSelS);
			objEstimate.setExecMode(pExecMode);
			est = objEstimate.getRawJoinEstimate();
		}
		//System.out.print("Approx. Estimate is: "+ est);
		return est;
	}
	
	/**
	 * Method to get the join selectivity of files processed.
	 * @param pPathFiles	Path containing the list of executed joins.
	 * @throws Exception 
	 */
	public static double[] getJoinEstimate(String pLstExecJobs, String pSamplingMethod, String pExecMode) throws Exception{
		
		// Configuring paths to process
		setJobsProcessed(pLstExecJobs);
		setDataLocation(pExecMode);
		setLstExecJobs();
		setExecTimes();
		
		double selectivity[] = new double[lstExecJobs.size()];
		
		for(int iCnt = 0; iCnt < lstExecJobs.size(); iCnt ++){
			if(!lstExecJobs.get(iCnt).equals("")){
				try{
					String parts[] = lstExecJobs.get(iCnt).split("\\.");
					//String pathR = DATA_LOCATION+parts[2]+FILE_EXT;
					String pathR = DATA_LOCATION+parts[4]+FILE_EXT;
					//String pathS = DATA_LOCATION+parts[3]+FILE_EXT;
					String pathS = DATA_LOCATION+parts[5]+FILE_EXT;
					Date initialTime = new Date();
					//selectivity[iCnt] = JoinEstimateExec.getJoinEstimate(pathR,
					//		pathS,parts[4],parts[5],pSamplingMethod,pExecMode);
					selectivity[iCnt] = JoinEstimateExec.getJoinEstimate(pathR,
							pathS,parts[6],parts[7],pSamplingMethod,pExecMode);
					Date finalTime = new Date();
					execTimes[iCnt] = finalTime.getTime() - initialTime.getTime();
					//System.out.println(parts[2] + "&" + parts[3] + "\t " + String.valueOf(selectivity[iCnt]));
				}
				catch(Exception e){
					System.out.println("Query File with some problem: "+lstExecJobs.get(iCnt));
					e.printStackTrace();
				}
			}
		}
		return selectivity;
	}
	
	/**
	 * Method to get all jobs processed according to JOBS_EXECUTED value.
	 * @return ArrayList with all jobs' names. 
	 */
	static private ArrayList<String> getJobsProcessed(String pJobLstPath){
		ArrayList<String> lines = new ArrayList<String>();
		File file = new File(pJobLstPath);
        BufferedReader reader = null;

        try {
            reader = new BufferedReader(new FileReader(file));
            String text = null;

            // repeat until all lines is read
            while ((text = reader.readLine()) != null)
            	lines.add(text);
                //contents.append(text).append(System.getProperty("line.separator"));

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		return lines;
	}
	
	/**
	 * Method to set the path of the executed jobs.
	 * @param pExecJobs
	 */
	static public void setJobsProcessed(String pExecJobs){
		if(pExecJobs != null)
			if(pExecJobs.equals(""))
				JOBS_EXECUTED = pExecJobs;
	}
	
	/**
	 * Default execution mode is true -> local. false -> distributed.
	 */
	static void setDataLocation(String pExecMode){
		// The default location is locally
		DATA_LOCATION = LOCAL_DATA_LOCATION;
		if(pExecMode.equalsIgnoreCase("false"))
			DATA_LOCATION = HDFS_DATA_LOCATION;
	}
	
	/**
	 * Method to set the list of executed jobs.
	 */
	public static void setLstExecJobs(){
		if(lstExecJobs == null)
			lstExecJobs = new ArrayList<String>();
		lstExecJobs = getJobsProcessed(JOBS_EXECUTED);
	}
	
	/**
	 * Method to initialize the vector of resulting execution times.
	 */
	public static void setExecTimes(){
		if(lstExecJobs != null)
			execTimes = new long[lstExecJobs.size()];
	}
	
	/**
	 * Method to initialize the vector of resulting execution times.
	 */
	public static void setApproxSelectivities(double pApproxSel[]){
		approxSelectivities	= pApproxSel;
	}
//	@Override
//	public int run(String[] arg0) throws Exception {
//		
//		Path pPathR1 = new Path(arg0[0]);
//		Path pPathR2 = new Path(arg0[1]);
//		
//		try{
//			// configure the job
//			Configuration conf = getConf();
//			Job job = new Job(conf,"JoinEstimateExec");
//			configureJob(conf,arg0[2]);
//			
//			TextInputFormat fileInFormat = new TextInputFormat();
//			FileInputFormat.addInputPath(job, pPathR1);
//			FileInputFormat.addInputPath(job, pPathR2);
//		    
//	
//		    job.setJarByClass(JoinEstimateExec.class);
//			job.setInputFormatClass(TextInputFormat.class);
//			job.setMapOutputKeyClass(TextInputFormat.class);
//			  
//			QzJoinEstimate objEstimate = new QzJoinEstimate(pPathR1, pPathR2);
//			System.out.print("Approx. Estimate is: "+objEstimate.getQzJoinEstimate(fileInFormat, job));
//			
//			return 0;
//		}
//		catch (Exception e){
//			e.printStackTrace();
//			return 1;
//		}
//	}
	
	
}
