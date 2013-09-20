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
package labbio.projects.hadoop.log.xmlparser;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Class used to parse Hadoop Statistics
 * @author renatomarroquin
 */
public class HadoopStatsParser {

	/**
	 * Scrapping Parameters 
	 */
	static public HashMap<String, HashMap> mParametersHashMap = new HashMap<String, HashMap>();
	
	/**
	 * Hash map where the results from each page will be stored.
	 */
	static protected ArrayList<String> mPageResults = new ArrayList<String>();
	
	/**
	 * Parameters' Names
	 */
	static protected ArrayList<String> mParamsNames = new ArrayList<String>();
	
	/**
	 * Default Hadoop Logs location.
	 */
	//private static String HADOOP_LOG_LOC = "/home/hadoop/hadoop/logs/history";
	
	private static String HADOOP_LOG_LOC = "/mnt/tpcDS/simWorkload/swHshJoin1GB/hshJoinsLogs/history";
	
	private static ArrayList<String> mFailedJobs = new ArrayList<String>();
	/**
	 * Default list of executed Hadoop jobs.
	 */
	private static String JOBS_EXECUTED = "/mnt/tpcDS/script/queryLst.lst";
	
	/**
	 * Method that will fill the hashMap with the results in the same way as the web scrapper
	 */
	public static void parseJobResults() {
		/**
		 * {->job_201105011614_0068
		 *  PigLatin:query.11.customer_demographics.store_returns.1.5.pig=
		 * 		{Reduce=[2.0, 0.0, 0.0, 0.0, 34.5], Map=[0.0, 3.0, 1.13501174E8, 2208314.0, 14.0]},
		 *  ->job_201105011614_0069
		 *  PigLatin:query.11.customer_address.store_returns.1.7.pig=
		 *  	{Reduce=[2.0, 0.0, 0.0, 0.0, 15.0], Map=[0.0, 2.0, 3.821217E7, 337514.0, 9.5]}
		 *  }
		 */
		ArrayList<String> alJobsParse = getJobsFromList(JOBS_EXECUTED);
		File[] alLogsAvail = getLogsAvailable(HADOOP_LOG_LOC);
		for(String queryName: alJobsParse){
			// search in all the log files for the ones that contain the information of our job
			String strKey = "PigLatin:"+queryName;
			for(int iCnt = 0; iCnt < alLogsAvail.length; iCnt ++){
				//if we find some logs belonging to it, then we must incorporate it to the results
				if(checkInterestingFile(alLogsAvail[iCnt].toString(),strKey)){
					HashMap<String, ArrayList<Double>> hshMapRed = parseFile(alLogsAvail[iCnt]);
					
					if(hshMapRed != null){
						// check if there a second part of the job
				    	if(mParametersHashMap.containsKey(strKey))
				    		addJobValues(strKey,hshMapRed);
				    	else 
				    		mParametersHashMap.put(strKey, hshMapRed);
			    	}
				}
			}
			
		}
	}

	public static boolean checkInterestingFile(String pFileLogName, String pExecJobName){
		 BufferedReader reader = null;
	     String text = null;
	     String jobName = "";
	     try {
	            reader = new BufferedReader(new FileReader(pFileLogName));
	            // repeat until all lines is read
	            while ((text = reader.readLine()) != null){
	            	String parts[] = text.split(" ");
	            	if(parts[0].equals("Job")){
	            		//Check if we are looking into the right file
	            		if("JOBNAME".equals(parts[2].split("=")[0])){
		            		jobName = removeChar(parts[2].split("=")[1].replace("\"", ""),'\\');
		            		if(jobName.equals(pExecJobName))
		            			return true;
		            		else
		            			return false;
	            		}
	            	}
	            }
	            
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
	     return false;
	}
	public static ArrayList<String> getTaskCounterValues(String pCounterValues){
		String strRegCounters = "\\{(.*?)\\}";
		String strSpecCounters = "\\[(.*?)\\]";
		String strInsideCounters = "\\((.*?)\\)";
		Pattern pCounters = Pattern.compile(strRegCounters);
		Pattern pSpecCounters = Pattern.compile(strSpecCounters);
		Pattern pInsideCounters = Pattern.compile(strInsideCounters);
		
		ArrayList<String> alTaskVals = new ArrayList<String> ();
		Matcher mCounters = pCounters.matcher(pCounterValues); 
		while (mCounters.find()) {
			// Usually there are only two, FileSystemCounters & MapReduce Framework
			String strCounters = mCounters.group(1);
			Matcher mSpecCounters = pSpecCounters.matcher(strCounters);
			while(mSpecCounters.find()){
				// there can be many counters and we have to check if they're wanted
				String strCounterVals = mCounters.group(1);
				Matcher mCounterVals =  pInsideCounters.matcher(strCounterVals);
				  while(mCounterVals.find()){
					  if(mParamsNames.contains(mCounterVals.group(1))){
						  mCounterVals.find();
						  mCounterVals.find();
						  alTaskVals.add(mCounterVals.group(1));
					  }
				  }
			}
		}
		return alTaskVals;
	}
	public static ArrayList<Double> getJobCounterValues(ArrayList<Double> alTaskVals,String pCounterValues){
		String strRegCounters = "\\{(.*?)\\}";
		String strSpecCounters = "\\[(.*?)\\]";
		String strInsideCounters = "\\((.*?)\\)";
		Pattern pCounters = Pattern.compile(strRegCounters);
		Pattern pSpecCounters = Pattern.compile(strSpecCounters);
		Pattern pInsideCounters = Pattern.compile(strInsideCounters);
		
		Matcher mCounters = pCounters.matcher(pCounterValues); 
		while (mCounters.find()) {
			// Usually there are only two, FileSystemCounters & MapReduce Framework
			String strCounterType = mCounters.group(1);
			//System.out.println(strCounterType);
			Matcher mSpecCounters = pSpecCounters.matcher(strCounterType);
			while(mSpecCounters.find()){
				String strSpecCounter = mSpecCounters.group(1);
				//System.out.println(strSpecCounter);
				Matcher mCountersValues = pInsideCounters.matcher(strSpecCounter);
				while(mCountersValues.find()){
					String strCounterName = mCountersValues.group(1);
					mCountersValues.find();
					mCountersValues.find();
					if(mParamsNames.contains(strCounterName)){
						int iPos = mParamsNames.indexOf(strCounterName);
						String strCounterValue = mCountersValues.group(1);
						alTaskVals.set(iPos, Double.valueOf(strCounterValue));
					}
					//System.out.println(mCountersValues.group(1));
				}
			}
		}
		return alTaskVals;
	}
	
	public static ArrayList<Double> consolidateTasks(HashMap<String,ArrayList<Double>> hshAttempts){
		
		ArrayList<Double> alTaskVals = getInitializedArrayList();
		for (Map.Entry<String, ArrayList<Double>> entry : hshAttempts.entrySet()) {
            //String key = entry.getKey();
			ArrayList<Double> values = entry.getValue();
			alTaskVals = addJobVals(alTaskVals, values);
        }
		return alTaskVals;
	}
	
	/**
	 * Method for adding the values of the array lists
	 * @param pAlJobVals
	 * @param pAlTaskVals
	 * @return
	 */
	public static ArrayList<Double> addJobVals(ArrayList<Double> pAlJobVals, ArrayList<Double> pAlTaskVals){
	
		for(int iCnt = 0; iCnt < pAlJobVals.size(); iCnt++)
			pAlJobVals.set(iCnt, pAlTaskVals.get(iCnt)+pAlJobVals.get(iCnt));
		
		return pAlJobVals;
	}
	
	/**
	 * Method to add map or reduce tasks in case we have requested them.
	 * @param pParam	Parameter to decide whether we are updating a map or a reduce task array list.
	 * @param pJobArrayList	The array list containing the overall values.
	 * @param pTaskArrayList The array list containing the task values.
	 * @return	the array list with the parameter added.
	 */
	@Deprecated
	public static ArrayList<Double> addSpecificJobVal(String pParam, ArrayList<Double> pJobArrayList, ArrayList<Double> pTaskArrayList){
		ArrayList<Double> alComplete = new ArrayList<Double>();
		
		if(mParamsNames.contains("TOTAL_LAUNCHED_REDUCES")&&!mParamsNames.contains("TOTAL_LAUNCHED_MAPS")){
			if(pParam.equals("Map")){
				for(double d: pTaskArrayList)
					alComplete.add(d);
				alComplete.set(0, 0.0);
			}
			if(pParam.equals("Reduce")){
				for(double d: pTaskArrayList)
					alComplete.add(d);
				alComplete.set(0, pJobArrayList.get(0));
			}
		}
		if(mParamsNames.contains("TOTAL_LAUNCHED_MAPS")&&!mParamsNames.contains("TOTAL_LAUNCHED_REDUCES")){
			if(pParam.equals("Map")){
				for(double d: pTaskArrayList)
					alComplete.add(d);
				alComplete.set(0, pJobArrayList.get(0));
			}
			if(pParam.equals("Reduce")){
				for(double d: pTaskArrayList)
					alComplete.add(d);
				alComplete.set(0, 0.0);
			}
		}
		if(mParamsNames.contains("TOTAL_LAUNCHED_MAPS")&&mParamsNames.contains("TOTAL_LAUNCHED_REDUCES")){
			if(pParam.equals("Map")){
				for(double d: pTaskArrayList)
					alComplete.add(d);
				alComplete.set(1,pJobArrayList.get(1));
			}
			if(pParam.equals("Reduce")){
				for(double d: pTaskArrayList)
					alComplete.add(d);
				alComplete.set(0,pJobArrayList.get(0));
			}
		}
		return alComplete;
	}
	public static HashMap<String, ArrayList<Double>> parseFile(File pLogFile){
		
		
		HashMap<String,ArrayList<Double>> hshTasks = new HashMap<String,ArrayList<Double>>();
		
		//TODO we should use only one hashMap
		HashMap<String,ArrayList<Double>> hshMapAttempts = new HashMap<String,ArrayList<Double>>();
		HashMap<String,ArrayList<Double>> hshRedAttempts = new HashMap<String,ArrayList<Double>>();
		HashMap<String,ArrayList<Double>> hshSetAttempts = new HashMap<String,ArrayList<Double>>();
		
        BufferedReader reader = null;
        String text = null;
        String strJobId = "";
        String jobName = "";
		int mapAttempts = 0, redAttempts = 0, setAttempts=0;
		
        try {
            reader = new BufferedReader(new FileReader(pLogFile));
            // repeat until all lines is read
            while ((text = reader.readLine()) != null){
            	
            	String parts[] = text.split(" ");
            	if(parts[0].equals("Job")){
            		//Check if we are looking into the right file
            		if("JOBNAME".equals(parts[2].split("=")[0])){
	            		jobName = removeChar(parts[2].split("=")[1].replace("\"", ""),'\\');
	            		String queryName = jobName.replace("PigLatin:", "");
	            		//if(pLogFile.toString().contains(queryName)){
	            			if(strJobId.equals(""))
	            				strJobId =  parts[1].split("=")[1].replace("\"", "");
	            		//}
	            		//else
	            		//	return null;
            		}
            		//Check if it was a successful job
            		if(parts[3].length() > 5){ //just to make sure we are looking into something wrong
            			if("SUCCESS".equals(parts[3].split("=")[1].replace("\"", ""))){
            				ArrayList<Double> alJobCountVas = getInitializedArrayList();
            				alJobCountVas = getJobCounterValues(alJobCountVas, text);
            				//adding time
            				hshTasks.put("Map", addSpecificJobVal("Map", alJobCountVas, consolidateTasks(hshMapAttempts)));
            				hshTasks.put("Reduce", addSpecificJobVal("Reduce", alJobCountVas, consolidateTasks(hshRedAttempts)));
            				return hshTasks;
            			}
            			else if("FAILED".equals(parts[3].split("=")[1].replace("\"", ""))){
            				mFailedJobs.add(jobName);
        					System.out.println("Failed Job: " + jobName);
        					return null;
        				}
            		}
           		}
            	//Checking when each task is being registered
            	if(parts[0].equals("Task")){
            		//Map
            		if(parts[2].split("=")[1].replace("\"", "").equals("MAP")){
            			if (!hshMapAttempts.containsKey(parts[1].split("=")[1].replace("\"", ""))){
            				double begTime = Double.parseDouble(parts[3].split("=")[1].replace("\"", ""));
            				ArrayList<Double> alTaskMap = getInitializedArrayList();
            				// we know that the time will always goat the end
            				alTaskMap.set(alTaskMap.size()-1, begTime);
            				hshMapAttempts.put(parts[1].split("=")[1].replace("\"", ""), alTaskMap); 
            			}
            			else{
            				if("SUCCESS".equals(parts[3].split("=")[1].replace("\"", ""))){
	            				ArrayList<Double> alTaskMap = hshMapAttempts.get(parts[1].split("=")[1].replace("\"", ""));
	            				double begTime = alTaskMap.get(alTaskMap.size()-1);
	            				double endTime = Double.parseDouble(parts[4].split("=")[1].replace("\"", ""));
	            				alTaskMap.set(alTaskMap.size()-1, (endTime-begTime)/(1000));
	            				alTaskMap = getJobCounterValues(alTaskMap, text);
	            				hshMapAttempts.put(parts[1].split("=")[1].replace("\"", ""), alTaskMap);
	            				///we don't want all parameters for all tasks
	            				//alTaskVals = getCounterValues(text);
	            				//alTaskVals.add(String.valueOf((tmpArray[1]-tmpArray[0])/ (60 * 1000)));
	            				//hshTasks.put("Map", alTaskVals);
            				}
            				else if("FAILED".equals(parts[3].split("=")[1].replace("\"", ""))){
            					System.out.println("jkvhjh");
            				}
            			}
            		}
            		//Reduce
            		if(parts[2].split("=")[1].replace("\"", "").equals("REDUCE")){
            			if (!hshRedAttempts.containsKey(parts[1].split("=")[1].replace("\"", ""))){
            				double begTime = Double.parseDouble(parts[3].split("=")[1].replace("\"", ""));
            				ArrayList<Double> alTaskRed = getInitializedArrayList();
            				// we know that the time will always goat the end
            				alTaskRed.set(alTaskRed.size()-1, begTime);
            				hshRedAttempts.put(parts[1].split("=")[1].replace("\"", ""), alTaskRed); 
            			}
            			else{
            				if("SUCCESS".equals(parts[3].split("=")[1].replace("\"", ""))){
            					ArrayList<Double> alTaskRed = hshRedAttempts.get(parts[1].split("=")[1].replace("\"", ""));
	            				double begTime = alTaskRed.get(alTaskRed.size()-1);
	            				double endTime = Double.parseDouble(parts[4].split("=")[1].replace("\"", ""));
	            				alTaskRed.set(alTaskRed.size()-1, (endTime-begTime)/(1000));
	            				alTaskRed = getJobCounterValues(alTaskRed, text);
	            				hshRedAttempts.put(parts[1].split("=")[1].replace("\"", ""), alTaskRed);
	            				///we don't want all parameters for all tasks
	            				//alTaskVals = getCounterValues(text);
	            				//alTaskVals.add(String.valueOf((tmpArray[1]-tmpArray[0])/ (60 * 1000)));
	            				//hshTasks.put("Reduce", alTaskVals);
            				}
            				else if("FAILED".equals(parts[3].split("=")[1].replace("\"", ""))){
            					System.out.println("jkvhjh");
            				}
            			}
            		}
            		//Setup
            		if(parts[2].split("=")[1].replace("\"", "").equals("SETUP")){
            			if (!hshSetAttempts.containsKey(parts[1].split("=")[1].replace("\"", ""))){
            				double begTime = Double.parseDouble(parts[3].split("=")[1].replace("\"", ""));
            				ArrayList<Double> alTaskSet = getInitializedArrayList();
            				// we know that the time will always goat the end
            				alTaskSet.set(alTaskSet.size()-1, begTime);
            				hshSetAttempts.put(parts[1].split("=")[1].replace("\"", ""), alTaskSet); 
            			}
            			else{
            				if("SUCCESS".equals(parts[3].split("=")[1].replace("\"", ""))){
            					ArrayList<Double> alTaskSet = hshSetAttempts.get(parts[1].split("=")[1].replace("\"", ""));
	            				double begTime = alTaskSet.get(alTaskSet.size()-1);
	            				double endTime = Double.parseDouble(parts[4].split("=")[1].replace("\"", ""));
	            				alTaskSet.set(alTaskSet.size()-1, (endTime-begTime)/(1000));
	            				alTaskSet = getJobCounterValues(alTaskSet, text);
	            				hshSetAttempts.put(parts[1].split("=")[1].replace("\"", ""), alTaskSet);
	            				//alTaskVals = getCounterValues(text);
	            				//alTaskVals.add(String.valueOf((tmpArray[1]-tmpArray[0])/ (60 * 1000)));
	            				//hshTasks.put("Setup", alTaskVals);
            				}
            				else if("FAILED".equals(parts[3].split("=")[1].replace("\"", ""))){
            					System.out.println("jkvhjh");
            				}
            			}
            		}
            	}
            	
            	//MapAttempt
            	if(parts[0].equals("MapAttempt")){
            		if(parts[1].split("=")[1].replace("\"", "").equals("MAP"))
            			if (hshMapAttempts.containsKey(parts[2].split("=")[1].replace("\"", "")))
            				//if we get only the successed ones, then the counter should change too
            				if("SUCCESS".equals(parts[4].split("=")[1].replace("\"", "")))
            					mapAttempts++;
            					
            		if(parts[1].split("=")[1].replace("\"", "").equals("SETUP"))
            			if (hshSetAttempts.containsKey(parts[2].split("=")[1].replace("\"", "")))
            				//if we get only the successed ones, then the counter should change too
            				if("SUCCESS".equals(parts[4].split("=")[1].replace("\"", "")))
            					setAttempts++;
           		}
            	
               	//ReduceAttempt
           		if(parts[0].equals("ReduceAttempt")){
           			if (hshRedAttempts.containsKey(parts[2].split("=")[1]))
           				//if we get only the successed ones, then the counter should change too
           				if("SUCCESS".equals(parts[4].split("=")[1].replace("\"", "")))
           					redAttempts++;
           		}
           		
            }

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
        
    	return hshTasks;
    	
	}
	
	public static ArrayList<Double> getInitializedArrayList(){
		ArrayList<Double> alInitialized = new ArrayList<Double>();
		
		// we use '=' because we need that slot for storing the time
		for(int iCnt = 0; iCnt <= mParamsNames.size(); iCnt++)
			alInitialized.add(0.0);
		
		return alInitialized;
	}
	
	/**
     * Method to add the values to a single job in case there are two or more
     * depending on each other.
     * @param pKey
     * @param pHshMapRed
     */
    public static void addJobValues(String pKey, HashMap<String,ArrayList<Double>> pHshMapRed){
    	
    	try{
    		if(!mFailedJobs.contains(pKey)){
	    	HashMap<String,ArrayList<Double>> hshMapRedOrig = mParametersHashMap.get(pKey);
	    	
	    	for(int iCnt=0; iCnt < hshMapRedOrig.get("Reduce").size(); iCnt++){
	    		
	    		double sumValsRed = Double.valueOf(hshMapRedOrig.get("Reduce").get(iCnt).toString()) + Double.valueOf(pHshMapRed.get("Reduce").get(iCnt).toString());
		    	double sumValsMap = Double.valueOf(hshMapRedOrig.get("Map").get(iCnt).toString()) + Double.valueOf(pHshMapRed.get("Map").get(iCnt).toString());
		    	hshMapRedOrig.get("Reduce").remove(iCnt);
		    	hshMapRedOrig.get("Map").remove(iCnt);
		    	hshMapRedOrig.get("Reduce").add(iCnt, sumValsRed);
		    	hshMapRedOrig.get("Map").add(iCnt, sumValsMap);
	    		
	    	}
    		mParametersHashMap.put(pKey, hshMapRedOrig);
    		}
    	}catch(Exception e){
			e.fillInStackTrace();
		}
    }
    
	public static File[] getLogsAvailable(String pHadoopLogLoc){
		
		File folder = new File(pHadoopLogLoc);
		File[] listOfFiles = null;
		
		// It is also possible to filter the list of returned files.
		// This example does not return any files that start with `.'.
		FilenameFilter filterHidden = new FilenameFilter() {
		    public boolean accept(File dir, String name) {
		        return (!name.startsWith(".") && !name.endsWith(".xml"));
		    }
		};

		
		if(folder.isDirectory())
			listOfFiles = folder.listFiles(filterHidden);
	    	    
		return listOfFiles;
	}
	
	public static void printJobResults(){
		
        Set s = mParametersHashMap.entrySet();
        int cntRow = 0;
        // first iterate over the jobs
        for (Map.Entry<String, HashMap> entry : mParametersHashMap.entrySet()) {
            //String key = entry.getKey();
            HashMap<String, ArrayList> value = entry.getValue();
            
            // Get the two arrays. First Map.
            Object mapArray[] = value.get("Map").toArray();
            // Then Reduce.
            Object redArray[] = value.get("Reduce").toArray();
            
            System.out.println(entry.getKey());
            
//            if(mapArray != null)
//            	for(int iCnt = 0; iCnt < mapArray.length; iCnt++){
//            		System.out.print(mapArray[iCnt].toString()+" ");
//            	}
//            System.out.println("");
//            if(redArray != null)
//            	for(int iCnt = 0; iCnt < redArray.length; iCnt++){
//            		System.out.print(redArray[iCnt].toString()+" ");
//            	}
//            System.out.println("");
        }
	}
	/**
     * initialize HashMap with parameters
     */
	public static void setTargetParams(String []pParams){
    	mParamsNames.addAll(Arrays.asList(pParams));
	}
	
	/**
	 * Method to get all jobs processed according to JOBS_EXECUTED value.
	 * @return ArrayList with all jobs' names. 
	 */
	static private ArrayList<String> getJobsFromList(String pJobLstPath){
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
	 * Method to remove a specific char from a String
	 * @param s	String where 'c' will be removed.
	 * @param c Character that will be removed from 's'.
	 * @return String without 'c' character.
	 */
	public static String removeChar(String s, char c) {

		String r = "";
		
		for (int i = 0; i < s.length(); i ++) 
			if (s.charAt(i) != c) r += s.charAt(i);
		
		return r;
	 }
	
	/**
	 * @param hADOOP_LOG_LOC the pHADOOP_LOG_LOC to set
	 */
	public static void setHadoopLogLoc(String pHADOOP_LOG_LOC) {
		HADOOP_LOG_LOC = pHADOOP_LOG_LOC;
	}

	/**
	 * @return the HADOOP_LOG_LOC
	 */
	public static String getHadoopLogLoc() {
		return HADOOP_LOG_LOC;
	}

	/**
	 * @param jOBS_EXECUTED the pJOBS_EXECUTED to set
	 */
	private static void setJobsExecuted(String pJOBS_EXECUTED) {
		JOBS_EXECUTED = pJOBS_EXECUTED;
	}

	/**
	 * @return the jOBS_EXECUTED
	 */
	private static String getJobsExecuted() {
		return JOBS_EXECUTED;
	}
	
	
}
