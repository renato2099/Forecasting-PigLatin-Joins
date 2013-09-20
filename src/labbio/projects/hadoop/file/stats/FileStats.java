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
package labbio.projects.hadoop.file.stats;

import java.io.IOException;
import java.util.List;
import java.util.Random;

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

/**
 * @author renatomarroquin
 */
public class FileStats {
	
	private Path path_File;
	
	private long firstRecordSize;
	
	private long inputSize;
	
	/**
	 * Default value is set to a negative number so it is only calculated
	 * only once and not every time its getter is called.
	 */
	private double approxCardinality = -1.0;
	
	/**
	 * Number of rows that will be taken from the split
	 */
	private int MAX_BORDER_LINES = 3;
	
	/**
	 * Line range to get an approximate record size. 
	 */
	private int TOP_LINES = 1000;
	
	private InputFormat inf;
	private Job job;
	
	/**
	 * Default constructor.
	 */
	public FileStats(){
		this(null,null,null);
	}
	
	/**
	 * FileStats Constructor.
	 * @param pPathFile	path where the file is.
	 * @param pJob		Job object that contains job information.
	 */
	public FileStats(Path pPathFile, Job pJob){
		this.path_File = pPathFile;
		this.job = pJob;
	}
	
	/**
	 * FileStats Constructor.
	 * @param pInf		InputFormat object that contains the file information.
	 * @param pJob		Job object that contains job information.
	 */
	public FileStats(InputFormat pInf, Job pJob){
		this.path_File = null;
		this.inf = pInf;
		this.job = pJob;
	}
	
	/**
	 * FileStats Constructor.
	 * @param pPathFile	path where the file is.
	 * @param pInf		InputFormat object that contains the file information.
	 * @param pJob		Job object that contains job information.
	 */
	public FileStats(Path pPathFile, InputFormat pInf, Job pJob){
		this.path_File = pPathFile;
		this.inf = pInf;
		this.job = pJob;
	}
	
	/**
	 * @param inf InputFormat to access HDFS properties.
	 * @param job Job which is executing the sampling process.
	 * @return the approximate number of rows because not all the lines are the same size.
	 * 
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public double getApproxCardinality(){
		try{
			// so we just calculate approxCardinality whenever it hasn't been calculated
			if (approxCardinality < 0){
				getInputSize();
				getRandomRecordSize();
				approxCardinality = Math.ceil(inputSize/firstRecordSize);
			}
			return approxCardinality;
		} 
		catch(Exception e){
			System.out.println(this.path_File.toString());
			e.printStackTrace();
			return 0.0;
		}
	} 
	
	/**
	 * Method that gets the number of bytes in the split and the size of the first record
	 * to calculate the approximate number of tuples for that specific split.
	 *   
	 * @param pSplitIndex	the split index which approximate number of tuples will be calculated.
	 * @return	the approximate number of tuples for that specific split
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public long getApproxCardinalityBySplit(int pSplitIndex) throws IOException, InterruptedException{
		
		long approxCardBySplit = -1;
		
		if (inf.getSplits(job).size() > pSplitIndex) {
			FileSplit fileSplit = (FileSplit) inf.getSplits(job).get(pSplitIndex);
			getRandomRecordSize();
			approxCardBySplit = (long) Math.ceil(fileSplit.getLength()/firstRecordSize);
		}
		
		return approxCardBySplit;
	}
	
	/**
	 * Method that returns the whole file length used by the 'job' in bytes.
	 * @return input size
	 */
	public long getInputSize() throws IOException, InterruptedException{
		
		inputSize = 0;
		FileSystem hdfs = FileSystem.get(job.getConfiguration());

		// FileSplit fileSplit = (FileSplit) inf.getSplits(job).get(0);
		// Path path = fileSplit.getPath();
		
		if(this.path_File == null){
			Path[] inputFilesPaths = ((FileInputFormat)inf).getInputPaths(job);
			//TODO if there are more than one path, me might iterate over it
			this.path_File = inputFilesPaths[0];
		}
		
		if (!hdfs.exists(this.path_File))
			inputSize = 0;
		else{
			FileStatus fs = hdfs.getFileStatus(this.path_File);
			inputSize = fs.getLen(); //the length of this file, in bytes.
		}
		return inputSize;
	}
	
	/**
	 * Method to get the right split for a job 
	 * if we were using TWO INPUT PATHS
	 * 
	 * @param pSplits	the split list
	 * @return			the index position of the right split
	 */
	//TODO if we are using only ONE input file then we should always get good splits 
	@Deprecated
	public int getRightSplitForPath(List<FileSplit> pSplits){
		int rightSplitIdx = 0;
		for(FileSplit obj: pSplits){
			// TODO This has to change because the way of obtaining the file is wrong
			//String tmp = (this.path_File.toString().contains("file:")?this.path_File.toString():"file:"+this.path_File.toString());
			if(obj.getPath().toString().equals(this.path_File.toString()))
				break;
			rightSplitIdx++;
		}
		return rightSplitIdx;
	}
	
	/**
	 * Method to get the right split for a job 
	 * if we were using TWO INPUT PATHS
	 * 
	 * @param pSplits	the split list
	 * @return			the index position of the right split
	 */
	//TODO if we are using only ONE input file then we should always get good splits 
	@Deprecated
	public int getRightSplitForPath(int idxSplit, List<FileSplit> pSplits){
		int rightSplitIdx;
		for(rightSplitIdx = idxSplit; rightSplitIdx < pSplits.size(); rightSplitIdx ++){
			if(pSplits.get(rightSplitIdx).getPath().toString().equals(this.path_File.toString()))
				break;
		}
		return rightSplitIdx;
	}
	
	/**
	 * @throws InterruptedException 
	 * @throws IOException 
	 * @return the firstRecordSize
	 * 
	 * {@link http://rosettacode.org/wiki/String_length#Java}
	 * Java encodes strings in UTF-16, which represents each character with one or two 16-bit
	 * values. The length method of String objects returns the number of 16-bit values used to
	 * encode a string, so the number of bytes can be determined by doubling that number. 
	 */
	public long getRandomRecordSize() throws IOException, InterruptedException {
		
		int iLenghtAcum = 0;
		List<FileSplit> splits = inf.getSplits(job);
		TaskAttemptContext samplingContext = new TaskAttemptContext(job.getConfiguration(), new TaskAttemptID());
		
		// Randomize the selection of the split so it is not always the first one
		Random r = new Random();
	    long seed = r.nextLong();
	    r.setSeed(seed);
	 // choosing a random record from the top TOP_LINES
	    int randRec = 0;
	    // attribute to make sure we are getting MAX_BORDER_LINES values
	    int aux = 0;
	    for(int iCnt = 0; iCnt < splits.size(); iCnt ++){
	    	
	    	InputSplit rightSplit = ((InputSplit)splits.get(iCnt));
	    	RecordReader reader = inf.createRecordReader(rightSplit, samplingContext);
	    	
	        firstRecordSize = 0;
	        aux = 0;
	        
		    while (randRec < getMaxBorderLines()) randRec = r.nextInt(TOP_LINES);
		    
		    
		    for(int cont = 0; cont <= randRec; ){
		        reader.initialize(rightSplit, samplingContext);
		        // THE COLUMN SEPARATOR IS NOT CONSIDERED BECAUSE IT AFFECTS ALL COLUMNS IN THE SAME WAY.
		        while(reader.nextKeyValue()){
		        	if (randRec-getMaxBorderLines() == cont){
		        		while (cont< randRec){
		        			if (reader.nextKeyValue()){
		        				iLenghtAcum += reader.getCurrentValue().toString().length();
		        				aux++;
		        				cont++;
		        			}
		        			else
		        				reader.initialize(rightSplit, samplingContext);
		        			
		        		}
		        		firstRecordSize += Math.ceil((iLenghtAcum+0.0)/(aux+0.0));// * 2;
		        	}
		        	
		        	cont ++;
		        	
		        	if(aux==getMaxBorderLines()) break;
		        	
		        }
		        reader.close();
		    }
		    
	    	
	    }
	    
	    firstRecordSize /= splits.size();
      if(firstRecordSize == 0)
    	  System.out.println("record size is zero");
        return firstRecordSize;
	}
	
	public long getNaiveRandomRecordSize() throws IOException, InterruptedException {
		
		List<FileSplit> splits = inf.getSplits(job);
		TaskAttemptContext samplingContext = new TaskAttemptContext(job.getConfiguration(), new TaskAttemptID());
		
		// Randomize the selection of the split so it is not always the first one
		Random r = new Random();
	    long seed = r.nextLong();
	    r.setSeed(seed);
	    
		int idxSplit = r.nextInt(splits.size());
		// check if the split is the correct one for the path if not find the closest one
		// idxSplit = getRightSplitForPath(idxSplit, splits);
		
		InputSplit rightSplit = ((InputSplit)splits.get(idxSplit));
        RecordReader reader = inf.createRecordReader(rightSplit, samplingContext);
        
        // choosing a random record from the top 100
	    int cont = 0, randRec = r.nextInt(1000);
	    
        firstRecordSize = 0; 
        reader.initialize(rightSplit, samplingContext);
        // THE COLUMN SEPARATOR IS NOT CONSIDERED BECAUSE IT AFFECTS ALL COLUMNS IN THE SAME WAY.
        while(cont <= randRec && reader.nextKeyValue()){
        	firstRecordSize = reader.getCurrentValue().toString().length();// * 2;
        	cont ++;
        }
        reader.close();
        
        return firstRecordSize;
	}

	/**
	 * @param mAX_BORDER_LINES the mAX_BORDER_LINES to set
	 */
	public void setMaxBorderLines(int mAX_BORDER_LINES) {
		MAX_BORDER_LINES = mAX_BORDER_LINES;
	}

	/**
	 * @return the mAX_BORDER_LINES
	 */
	public int getMaxBorderLines() {
		return MAX_BORDER_LINES;
	}
	
	
}
