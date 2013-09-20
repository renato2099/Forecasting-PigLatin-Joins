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
package labbio.projects.analysis;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import labbio.projects.hadoop.estimates.job.JobParamsEstimator;
import labbio.projects.hadoop.executor.JoinEstimateExec;
import labbio.projects.hadoop.log.xmlparser.HadoopStatsParser;
import labbio.projects.statistics.DataSet;
import labbio.projects.statistics.Observation;

/**
 * Class used to run MultiCorrelation Analysis
 * @author renatomarroquin
 */
public class MultCorrHadoopExec {
	
	/**
	 * Default path of the list containing the jobs executed.
	 */
	public static String JOBS_EXECUTED = "/mnt/tpcDS/script/queryLst.lst";
	
	/**
	 * Default path of the jobs list for which the time will be predicted.
	 */
	public static String JOBS_PREDICTED = "/mnt/tpcDS/script/predQueryLst.lst";
	
	/**
	 * Default data file extension.
	 */
	public static String FILE_EXT = ".dat";
	
	/**
	 * Default data files' location.
	 */
	public static String HDFS_DATA_LOCATION = "pigData/";
	public static String LOCAL_DATA_LOCATION = "/mnt/tpcDS/data/";
	public static String DATA_LOCATION;
	
	/**
	 * Array with the names of all jobs which execution time will be predicted.
	 */
	public static ArrayList<String> aListPredictionJobs;
	
	/**
	 * Web Scraping parameters.
	 */
	//TODO the scrapping parameters "Launched reduce tasks","Launched map tasks" don't make 
	// any difference because they are hard-coded @HadoopStatsScrapper.loadResults
	//public static String scrapParams[] = { /*"Launched reduce tasks",*/
	//	"Launched map tasks", /*"FILE_BYTES_READ",*/"HDFS_BYTES_READ","Map input records"};
	public static String scrapParams[] = { /*"Launched reduce tasks",*/
		"TOTAL_LAUNCHED_MAPS", /*"FILE_BYTES_READ",*/"HDFS_BYTES_READ","MAP_INPUT_RECORDS"};
	/**
	 * Multiple Regression parameters.
	 */
	public static String modelParams[] = {/*"Launched reduce tasks",*/
		"TOTAL_LAUNCHED_MAPS",/*"FILE_BYTES_READ",*/"HDFS_BYTES_READ","MAP_INPUT_RECORDS","Join Estimate"};
	
	/**
	 * The default sampling method used. raw, qz.
	 */
	public static String DEFAULT_SAMPLING = "qz";
	
	/**
	 * Default execution mode. true -> local. false -> distributed.
	 */
	public static String EXEC_MODE = "true";
	
	/**
	 * Default model to use.
	 * 		wo 	 -> without joinSel.
	 * 		with -> use joinSel.
	 * 		both -> create both models.
	 */
	public static String USED_MODEL = "wo";
	
	/**
	 * If the model will contain the selectivity parameter or not.
	 * true -> does contain. false -> does not contain.
	 */
	public static boolean modelType;
	
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		
		//String execMode = args[0];
		USED_MODEL = args[0].toLowerCase();
		EXEC_MODE = args[1].toLowerCase();
		DATA_LOCATION = EXEC_MODE.equals("true")?LOCAL_DATA_LOCATION:HDFS_DATA_LOCATION;
				
        String arg[] = new String[args.length -2];
 		for (int iCnt = 0; iCnt < args.length-2; iCnt ++)
 			arg[iCnt] = args[iCnt+1];
 		
 		Date initTime;
 		Date endTime;
 		
 		if(USED_MODEL.equals("both")){
 			initTime = new Date();
 			forecastWOJoinSelectivity(arg);
 			endTime = new Date();
 			System.out.println("forecastWOJoinSelectivity -> "+
 					String.valueOf((endTime.getTime()-initTime.getTime())/1000.0));
 			
 			initTime = new Date();
 			forecastJoinSelectivity(arg);
 			endTime = new Date();
 			System.out.println("forecastJoinSelectivity -> "+
 					String.valueOf((endTime.getTime()-initTime.getTime())/1000.0));
 		}
 		else if(USED_MODEL.equals("with")){
 			initTime = new Date();
 			forecastJoinSelectivity(arg);
 			endTime = new Date();
 			System.out.println("forecastWOJoinSelectivity -> "+
 					String.valueOf((endTime.getTime()-initTime.getTime())/1000.0));
 		}
 		else{
 			initTime = new Date();
 			forecastWOJoinSelectivity(arg);
 			endTime = new Date();
 			System.out.println("forecastJoinSelectivity -> "+
 					String.valueOf((endTime.getTime()-initTime.getTime())/1000.0));
 		}
	}

	/**
	 * Method to create and get the predicted value for the observation made.
	 * @param execMode	if the model will be executed over local files or over HDFS files
	 * @param arg		the input files for estimation
	 * @throws Exception 
	 */
	static public void forecastJoinSelectivity(String arg[]) throws Exception{
		
		// 1 -> Generate model
		// TODO 1.1 -> running training queries
		// 1.2 -> Build model
		// 1.2.1 -> web scrapping
		getModelParameters();

		// 1.2.2 -> model building
    	 MultipleCorrelation obj = new MultipleCorrelation();
    	 obj.setVarNames(modelParams);
    	 //double joinJobsParams [][] = transformScrapResult(HadoopStatsScrapper.mParametersHashMap);
    	 double joinJobsParams [][] = transformScrapResult(HadoopStatsParser.mParametersHashMap);
    	 HadoopStatsParser.printJobResults();
    	 double joinSelectivityParams [] = JoinEstimateExec.getJoinEstimate(JOBS_EXECUTED, DEFAULT_SAMPLING,EXEC_MODE);
    	 for(int iCnt = 0; iCnt< JoinEstimateExec.lstExecJobs.size(); iCnt++){
    		 
    		 System.out.println(JoinEstimateExec.lstExecJobs.get(iCnt)+"\t Selectivity\t" + String.valueOf(joinSelectivityParams[iCnt]));
    	}
    	 DataSet ds = MultipleCorrelation.constructDataSet(updateData(joinJobsParams, joinSelectivityParams));
    	 // initializing the model
    	 obj.init(ds);
    	 
    	 if(arg.length > 1){
	         // 2 -> Get join selectivity for jobs
	         // 2.1 -> Execute join selectivity estimator for each job
	         // 2.2 -> Update the data set with the obtained new parameters
	         obj.init(ds);
	    	 
	         // 3 -> Create observation to forecast
	         // 3.1 -> Get regular parameters (data we are sure about e.g. file length, number of files, etc.)
	         // 3.2 -> Get estimated parameters (data we are not sure about e.g. # of reducers, # of mappers, etc.)
	         Observation loObs = getObservation(EXEC_MODE, arg);
	         
	         // 3 -> Forecast
	         System.out.println(obj.printt());
	         System.out.println("Forecasting for job: " + arg.toString());
	         System.out.println("Forecast for Depending Variable -> " + obj.forecast(loObs));
    	 }
         else {
        	// 2 -> Create observation to forecast
             // 2.1 -> Get regular parameters
             // 2.2 -> Get estimated parameters
        	 Observation[] loObs;
        	 if (arg.length == 1)
        		 loObs = getObservation(EXEC_MODE, arg[0]);
        	 else
	        	 loObs = getObservation(EXEC_MODE, JOBS_PREDICTED);
	         // 3 -> Forecast
	         System.out.println(obj.printt());
	         for(int iCnt = 0; iCnt < loObs.length; iCnt++){
	        	 //System.out.println("Forecasting for job: " + aListPredictionJobs.get(iCnt));
	        	 System.out.println(aListPredictionJobs.get(iCnt) + "\t "+ obj.forecast(loObs[iCnt]));
	         }
         }
         
	}
	
	/**
	 * Method to create and get the predicted value for the observation made.
	 * @param execMode	if the model will be executed over local files or over HDFS files
	 * @param arg		the input files for estimation
	 */
	static public void forecastWOJoinSelectivity(String arg[]){
		// 1 -> Generate model
		// TODO 1.1 -> running training queries
		// 1.2 -> Build model
		// 1.2.1 -> web scrapping
		getModelParameters();

		// 1.2.2 -> model building
    	 MultipleCorrelation obj = new MultipleCorrelation();
    	 //// without join selectivity the scrapping parameters are the same as the model's
    	 obj.setVarNames(scrapParams);
    	// initializing the model
         //obj.init(MultipleCorrelation.constructDataSet(transformScrapResult(HadoopStatsScrapper.mParametersHashMap)));
    	 obj.init(MultipleCorrelation.constructDataSet(transformScrapResult(HadoopStatsParser.mParametersHashMap)));
    	 
         if(arg.length > 1){
             // 2 -> Create observation to forecast
             // 2.1 -> Get regular parameters
             // 2.2 -> Get estimated parameters
	         Observation loObs = getObservation(EXEC_MODE, arg);
	         
	         // 3 -> Forecast
	         System.out.println(obj.printt());
	         System.out.println("Forecasting for job: " + arg.toString());
	         System.out.println("Forecast for Depending Variable -> " + obj.forecast(loObs));
         }
         else{
        	// 2 -> Create observation to forecast
             // 2.1 -> Get regular parameters
             // 2.2 -> Get estimated parameters
        	 Observation[] loObs;
        	 if (arg.length == 1)
        		 loObs = getObservation(EXEC_MODE, arg[0]);
        	 else
	        	 loObs = getObservation(EXEC_MODE, JOBS_PREDICTED);
	         
	         // 3 -> Forecast
	         System.out.println(obj.printt());
	         for(int iCnt = 0; iCnt < loObs.length; iCnt++){
//	        	 System.out.println("Forecasting for job:" + aListPredictionJobs.get(iCnt));
//	        	 System.out.println("\t Forecast for Depending Variable Time (s) -> " + obj.forecast(loObs[iCnt]));
	        	 System.out.println(aListPredictionJobs.get(iCnt) + "\t" + obj.forecast(loObs[iCnt]));
	        	 //System.out.println("\t Forecast for Depending Variable Time (s) -> " + );
	         }
         }
	}
	
	static public Observation[] getObservation(String pExecMode, String pLstPath){
		
		aListPredictionJobs = getJobsFromList(pLstPath);
		Observation[] aLstObservations = new Observation[aListPredictionJobs.size()];
		
		for(int iCnt = 0; iCnt < aListPredictionJobs.size(); iCnt ++){
			if(!aListPredictionJobs.get(iCnt).equals("")){
				try{
					String parts[] = aListPredictionJobs.get(iCnt).split("\\.");
					String pathR = DATA_LOCATION+parts[2]+FILE_EXT;
					String pathS = DATA_LOCATION+parts[3]+FILE_EXT;
					String pathList[] = {pathR, pathS, parts[4],parts[5]};
					aLstObservations[iCnt] =  getObservation(pExecMode, pathList);
					//System.out.println(parts[2] + "&" + parts[3] + "\t " + String.valueOf(selectivity[iCnt]));
				}
				catch(Exception e){
					System.out.println("Query File with some problem: "+aListPredictionJobs.get(iCnt));
					e.printStackTrace();
				}
			}
		}
			
		return aLstObservations;
	}
	
	/**
	 * Method to set values that will be needed in the model.
	 * @param pExecMode	Execution type.
	 * @param pArgs		The parameters of the job that will be executed: Path1,Path2,Col1,Col2.
	 * @return	The observation object with all the parameters set.
	 */
	static public Observation getObservation(String pExecMode, String pArgs[]){
		
		try {
			String pathList[] = {pArgs[0], pArgs[1]};
			JobParamsEstimator.initializer(pExecMode, pathList);
			
			Observation loObs = new Observation(0.0);
			
			// adding scrapping parameters
			for(String strParam : scrapParams){
				if(strParam.equals("Launched map tasks")) loObs.setIndependentValue("Launched map tasks", JobParamsEstimator.estimateNumberOfMappers());
				if(strParam.equals("TOTAL_LAUNCHED_MAPS")) loObs.setIndependentValue("TOTAL_LAUNCHED_MAPS", JobParamsEstimator.estimateNumberOfMappers());
				if(strParam.equals("Launched reduce tasks")) loObs.setIndependentValue("Launched reduce tasks", JobParamsEstimator.estimateNumberOfReducers());
				if(strParam.equals("Data-local map tasks"))	loObs.setIndependentValue("Data-local map tasks", 15.0);
				if(strParam.equals("FILE_BYTES_READ"))	loObs.setIndependentValue("FILE_BYTES_READ", 15.0);
				if(strParam.equals("HDFS_BYTES_READ"))	loObs.setIndependentValue("HDFS_BYTES_READ", JobParamsEstimator.getTotalInputBytes());
				if(strParam.equals("Map input records"))	loObs.setIndependentValue("Map input records", JobParamsEstimator.getTotalInputRecords());
				if(strParam.equals("MAP_INPUT_RECORDS"))	loObs.setIndependentValue("MAP_INPUT_RECORDS", JobParamsEstimator.getTotalInputRecords());
			}
	                
	        // adding the join estimate parameter depeding on the model we are executing
        	if(modelType)
				loObs.setIndependentValue("Join Estimate",JoinEstimateExec.getJoinEstimate(pArgs[0],
						pArgs[1],pArgs[2],pArgs[3],DEFAULT_SAMPLING,EXEC_MODE));
        	
        	return loObs;
        	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error setting observation parameters");
			e.printStackTrace();
			return null;
		}

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
	 * Method to add join Selectivity estimates to the data model. 
	 * @param pData		Data collected by the scrapping process.
	 * @param pNewData	Data collected in the join selectivity estimation process.
	 * @return	An array of data combined (scrapping results + join selectivity results)
	 */
	static public double[][] updateData(double pData[][], double pNewData[]){
		
		double newData[][] = new double[pData.length][];
		
		for(int iCnt = 0; iCnt < pData.length; iCnt ++){
			
			newData[iCnt] = new double[((pData[iCnt].length)+1)];
			
			for(int iCol = 0; iCol < pData[iCnt].length; iCol++)
				newData[iCnt][iCol] = pData[iCnt][iCol];
			
			double tmp = newData[iCnt][pData[iCnt].length-1];
			newData[iCnt][pData[iCnt].length-1] = pNewData[iCnt];
			newData[iCnt][pData[iCnt].length] = tmp;
			
		}
		return pData;
	}
	
	/**
	 * Method to set the parameters that will be used in the scrapping process.
	 */
	public static void getModelParameters(){
		//TODO these parameters should all be set automatically.
//		HadoopStatsScrapper.setTargetParams(scrapParams);
//    	String url="http://localhost:50030/jobdetails.jsp?jobid=";
//    	String urlTasks="http://localhost:50030/jobtasks.jsp?jobid=";
//
//    	String Id = "201104232103_0";
//    	String jobId = "job_".concat(Id);
//    	HadoopStatsScrapper.scrapHadoopWeb(url, urlTasks, Id);
		/***** SCRAPPING ***********/
		//HadoopStatsScrapper.setTargetParams(scrapParams);
		//HadoopStatsScrapper.setScrappingScope();
		//HadoopStatsScrapper.scrapHadoopWeb();
		/*****************************/
		
		HadoopStatsParser.setTargetParams(scrapParams);
		HadoopStatsParser.parseJobResults();
	}
	
	/**
    * Method to construct the dataSet
    * @param pAlResults	parser results
    * @return the multipleCorreation datasets
    */
	public static double[][] transformScrapResult(HashMap<String, HashMap> pAlResults){
		// the number of rows is the number of keys (job names) multiplied by 2 (for Map and for Reduce)
		// the number of columns is the number of variables + the dependent variable (elapsed time)
		
		//TODO the size of the data matrix should not be determined by the scrapParams because they might change
		//double data[][] = new double[pAlResults.size()][scrapParams.length+1];
		double data[][] = new double[pAlResults.size()][];
		
        Set s = pAlResults.entrySet();
        int cntRow = 0;
        // first iterate over the jobs
        for (Map.Entry<String, HashMap> entry : pAlResults.entrySet()) {
            //String key = entry.getKey();
            HashMap<String, ArrayList> value = entry.getValue();
            
            try{
            // Get the two arrays. First Map.
            Object mapArray[] = value.get("Map").toArray();
            // Then Reduce.
            Object redArray[] = value.get("Reduce").toArray();
            data[cntRow] = new double[redArray.length];
            
            for(int cntArray = 0; cntArray < mapArray.length; cntArray++)
                data[cntRow][cntArray] += Double.valueOf(mapArray[cntArray].toString()) + Double.valueOf(redArray[cntArray].toString());
            
            cntRow++;
            }catch(Exception e){
            	e.printStackTrace();
            }
        }

        //data = scrappDataToModel(data);
		printData(data);
		return data;
	}
	
	public static void printData(double pData[][]){
		
		for(int iCnt=0; iCnt<pData.length; iCnt++){
			for(int iRow=0; iRow<pData[0].length; iRow++){
				System.out.print(String.valueOf(pData[iCnt][iRow])+"\t");
			}
			System.out.println("");
		}
		
	}
	/**
	 * Method to adjust the scrapped data into the required by the model.
	 * TODO This is not the right way to to it. The scrapper is wrong.
	 * @param scrappData
	 * @return	adjusted data.
	 */
	//as our data comes ok we don't need to remove its columns anymore
	@Deprecated
	public static double[][] scrappDataToModel(double scrappData[][]){
		
		double modelData[][] =  scrappData;
		boolean flgMap = true;
		boolean flgRed = true;
		
		// if we want to take out mappers or reducers information then we have to do this
		for(String strParams : scrapParams){
			//TODO //we now use only the names in capital letters
			if(strParams.equals("Launched reduce tasks"))
				flgRed = false;
			//TODO //we now use only the names in capital letters
			if(strParams.equals("Launched map tasks"))
				flgMap = false;
		}
		
		if(flgRed) modelData = removeCol(scrappData,0);
		if(flgMap) modelData = removeCol(modelData,0);
		
		return modelData;
	}
	
	
	public static double[][] removeCol(double [][]pData, int pCol){
		
		double [][] newData = new double[pData.length][pData[0].length-1];
		
		for(int iRow = 0; iRow < pData.length; iRow++){
			int iNewCols = 0;
			for(int iCol = 0; iCol < pData[0].length; iCol++){
				if(iCol != pCol){
					newData[iRow][iNewCols] = pData[iRow][iCol];
					iNewCols++;
				}
			}
			
		}
		return newData;
	}
	
	/**
	 * Method to determine the parameters that will be recorded
	 * @param pWithWoJoinEstimate
	 * @return
	 */
	public static String[] getHadoopParams(){
		//"Data-local map tasks",//"FILE_BYTES_READ",
		String hadoopParams[];
		if(modelType){
			String hadoopParams1[] = {"Launched map tasks",
    			"Launched reduce tasks","HDFS_BYTES_READ","Map input records","Join Estimate"};
		 hadoopParams = hadoopParams1;
		}
		else{
			String hadoopParams1[] = {"Launched map tasks",
	    		"Launched reduce tasks", "HDFS_BYTES_READ","Map input records"};
			 hadoopParams = hadoopParams1;
		}
    	return hadoopParams;
    }
}
