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
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;

import labbio.projects.hadoop.file.stats.FileStats;

/**
 * Class to measure the best quantity of records to fetch
 * in order to obtain a better file cardinality based on 
 * the number of lines within the file.
 * 
 * @author rmogrovejo
 *
 */
public class FileCardinalityExec {

	/**
	 * Matrix that will hold the error for all cardinalities of data files.
	 */
	private double measureError[][];
	
	/**
	 * Array containing files' real cardinalities.
	 */
	private double fileRealCard[];
	
	/**
	 * Array containing files' calculated cardinalities.
	 */
	private double fileCalcCard[];
	
	/**
	 * The number of elements which will be used to determine cardinality.
	 */
	private static int ELEM_FETCHED[]={100,500,900};
	
	/**
	 * Arraylist containing the file names to be checked.
	 */
	private String fileNames[];
	
	/**
	 * Path where the files are.
	 */
	private String dataPath;
	
	/**
	 * Command to get line counts from the files.
	 */
	private static String GET_NUMBER_LINES_CMMD = "wc -l";
	
	/**
	 ****************************************************
	 * NOTE: This class is to be executed only locally. *
	 ****************************************************
	 * @param args	/mnt/tpcDS/data/
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			
			FileCardinalityExec cardExec = new FileCardinalityExec(args[0]);
			cardExec.getRealCard();
//			for(int i=0; i< cardExec.fileRealCard.length; i++){
//				double realCard = cardExec.fileRealCard[i];
//				System.out.println(cardExec.fileNames[i] +" "+String.valueOf(realCard));
//			}
			for(int iCnt = 0; iCnt < ELEM_FETCHED.length; iCnt++){
				cardExec.getCalcCard(ELEM_FETCHED[iCnt]);
				cardExec.measureError[iCnt] = cardExec.getError();
			}
			
			for(int iCnt = 0; iCnt < ELEM_FETCHED.length; iCnt++){
				System.out.println("For element " + String.valueOf(ELEM_FETCHED[iCnt]));
				double acum = 0.0;
				for(double err : cardExec.measureError[iCnt]){
					acum += err;
					System.out.println("\t"+String.valueOf(err));
				}
				System.out.println("Avg. Error: " + String.valueOf(acum/cardExec.measureError[iCnt].length));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * Default Constructor
	 */
	public FileCardinalityExec(String dataFilesPath){
		this.measureError = new double[ELEM_FETCHED.length][];
		this.dataPath = dataFilesPath;
		this.getFileNames();
	}
	/**
	 * 
	 */
	public void getCalcCard(int iNumElemFetched){
		
		try {
			
			this.fileCalcCard = new double[this.fileNames.length];
			
			for(int iCnt = 0; iCnt < this.fileNames.length; iCnt ++){
				Job objJob = new Job();
				Path objPath = new Path(this.dataPath+"\\"+this.fileNames[iCnt]);
				TextInputFormat objInf = new TextInputFormat();
				objInf.addInputPath(objJob, objPath);
				FileStats fsObj = new FileStats(objPath, objInf, objJob);
				fsObj.setMaxBorderLines(iNumElemFetched);
				this.fileCalcCard[iCnt] = fsObj.getApproxCardinality();
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Method to get the real cardinality of data files.
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public void getRealCard() throws IOException, InterruptedException{
				
		this.fileRealCard = new double[this.fileNames.length];
		
		for(int iCnt = 0; iCnt < this.fileNames.length; iCnt ++){
			
			Runtime run = Runtime.getRuntime();
			Process pr = run.exec(GET_NUMBER_LINES_CMMD + " " + this.dataPath+"/"+this.fileNames[iCnt]);
			pr.waitFor();
			
			BufferedReader buf = new BufferedReader( new InputStreamReader( pr.getInputStream() ) ) ;
			String line ;
			while ( (  line = buf.readLine() ) != null ) 
			{
				//System.out.println(line) ;
				String parts[] = line.split(" ");
				this.fileRealCard[iCnt] = Double.parseDouble(parts[0]);
			}
			
		}
		
	}
	
	/**
	 * Method to get the file names within the data path specified. 
	 */
	public void getFileNames(){
		
		File fo = new File(this.dataPath);
		if(fo.isDirectory())
			this.fileNames = fo.list();
		
	}
	
	public double[] getError(){
		
		double error[] = new double[this.fileNames.length];
		for(int iCnt = 0; iCnt < this.fileNames.length; iCnt++)
			error[iCnt] = (Math.abs((this.fileRealCard[iCnt] - this.fileCalcCard[iCnt]))+0.0)/ (this.fileRealCard[iCnt]+0.0);
		return error;
	}
}
