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
package labbio.projects.hadoop.estimates.join;

import java.io.IOException;
import java.util.Arrays;

import labbio.projects.hadoop.executor.JoinEstimateExec;
import labbio.projects.hadoop.file.stats.FileStats;
import labbio.projects.hadoop.sampler.Sampler;
import labbio.projects.hadoop.sampler.impl.ClusterSampler;
import labbio.projects.hadoop.sampler.impl.SystematicSampler;
import labbio.projects.hadoop.statistics.CDF_Normal;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.InputFormat;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.ToolRunner;

/**
 * This class encapsulates the selectivity estimation process
 * explained by QIANG ZHU in his paper 'An integrated Method
 * for Estimating Selectivities in a Multidabase System.'
 * 
 * ***  CLT  ***
 * The Central Limit Theorem states that given a distribution with a mean �� and variance ����,
 * the sampling distribution of the mean approaches a  normal distribution with a mean (��) 
 * and a variance ����/N as N, the  sample size, increases.
 * *************
 * 
 * @author rmogrovejo
 */
public class QzJoinEstimate {
     
    /**
     * Arrays of all sampled objects for relations R and S.
     */
    private Object[] samplesR;
    private Object[] samplesS;
    
    /**
     * Size percentage to be sampled from relations R and S.
     */
    private double percentageSizeR;
    private double percentageSizeS;
    
    /**
     * Columns to be sampled from relations R and S.
     */
    private int colSampledR = 1;
    private int colSampledS = 1;
    
    /**
     * Paths for both Relations.
     */
    private Path path_R;
    private Path path_S;
   
    /**
     * number of R1 tuples that match with tuples from R2.
     */
    private long total_match;
   
    /**
     * number of tuples sampled.
     */
    private long total_sample;
   
    /**
     * Confidence level required.
     */
    private double confLevel;
    private double zValue;

    /**
     * Execution mode. true -> local. false -> distributed.
     */
    private String []execMode = {"true"};
    
    /**
     * 'e' the desired limit of a relative error.
     */
    private static final double DEFAULT_ERROR = 0.9999999999999999999999999999999999;
    //private static final double DEFAULT_ERROR = 0.001;
    
    /**
     * ��Sr	-> tuples in Sr that satisfy the qualification F.
     * 		-> tuples that satisfy the join condition.
	 * 'b' is the maximum size of all ��Sr.
	 * represents a percentage of the worst case of the join
	 * (a percentage of the Cartesian product)
	 */
    private static double MAX_PERCEN_NUM_MATCHES = 0.0001;
    private static double MAX_NUM_MATCHES = 1000;
    
    /**
     * Percentage that will be read from the relation.
     */
    private final static double DEFAULT_SAMPLE_PERCENTAGE = 0.6;
    
    /**
     * Confidence level with which the stopping point will be built.
     */
    private final static double DEFAULT_CONFIDENCE_LEVEL = 0.99;
    
    /**
     * This represents how much of relation 'S' will be taken compared to relation 'R'.
     */
    private final static double SAMPLE_RATIO = 0.25;
    
    /**
     * Default constructor to set PathR1 and PathR2.
     */
    public QzJoinEstimate(Path pPathR1, Path pPathR2){
        this(DEFAULT_CONFIDENCE_LEVEL, MAX_PERCEN_NUM_MATCHES, DEFAULT_SAMPLE_PERCENTAGE, pPathR1, pPathR2);
    }
   
    /**
     * Constructor with parameters to set pSampleSize, PathR1 and PathR2.
     * @param pSampleSize
     * @param pPathR1
     * @param pPathR2
     */
    public QzJoinEstimate(double pSampleSize, Path pPathR1, Path pPathR2){
        this(DEFAULT_CONFIDENCE_LEVEL, MAX_PERCEN_NUM_MATCHES, pSampleSize, pPathR1, pPathR2);
    }
   
    /**
     * Constructor with parameters to set total_match, total_sample, PathR1 and PathR2.
     * @param pConfLevel    confidence level for sampling
     * @param pTotalMatch    number of matches
     * @param pTotalSample    number of samples
     * @param pPathR1        path to the relation 1
     * @param pPathR2        path to the relation 2
     */
    public QzJoinEstimate(double pConfLevel, double pMaxPercenMatch, double pSampleSize, Path pPathR1, Path pPathR2){
        setConfLevel(pConfLevel);
        percentageSizeR = pSampleSize;
        // as relation 'S' might be too big only a part of it will be considered
        percentageSizeS = Math.min(1,pSampleSize * SAMPLE_RATIO);
        path_R = pPathR1;
        path_S = pPathR2;
        MAX_PERCEN_NUM_MATCHES = pMaxPercenMatch;
    }

    public void setConfLevel(double pConfLevel){
       
        this.confLevel = pConfLevel;
        if (pConfLevel == 0.95) this.zValue = 1.96039;
        else if (pConfLevel == 0.99) this.zValue = 2.5762;
        else this.zValue = 1.6421;
       
    }
    
    /**
     * Method to configure sampler object for whatever it is required
     * @param pSamplerType	type of sampler
     * @param pSampler		object to be configured
     * @param pPercenRel	percentage of the relation to be sampled
     * @param pColToSample	column to be sampled
     * @return	object configured
     */
   private Sampler samplerFactory(Path pFilePath, String pSamplerType, double pPercenRel, int pColToSample){
	   
	   //TODO modify the other samplers so they can be used from the estimates methods
	   Sampler pSampler = null;
	   
	   if (pSamplerType.equals("Cluster")) 	
		   pSampler = new ClusterSampler(pFilePath, pPercenRel,Integer.MAX_VALUE,pColToSample);
	   if (pSamplerType.equals("SysSmp")) 	
		   pSampler = new SystematicSampler(pFilePath, pPercenRel,Integer.MAX_VALUE, pColToSample);
	   	   
	   return pSampler;
   }

    public double getQzJoinEstimate(){
       
        double pSelectivity_Estimate = 0.0;
        
        try {
        	TextInputFormat inf = new TextInputFormat();
            //TODO a factory for the samplers
        	Sampler objSamplerR = samplerFactory(this.path_R, "SysSmp", this.percentageSizeR, this.colSampledR);
            Sampler objSamplerS = samplerFactory(this.path_S, "Cluster", this.percentageSizeS, this.colSampledS);
            
            // Sampling data from relation S
            // TODO feels weird having to cast the object back into what it is
            if(ToolRunner.run((ClusterSampler)objSamplerS,this.execMode)!=0) return -1;
            if(ToolRunner.run((SystematicSampler)objSamplerR,this.execMode)!=0) return -1;
            
            
            
            FileStats R1FileStats = new FileStats(this.path_R, inf, objSamplerR.getJobObj());
            FileStats R2FileStats = new FileStats(this.path_S, inf, objSamplerS.getJobObj());
            
            // make S the bigger relation
            if (R1FileStats.getApproxCardinality()> R2FileStats.getApproxCardinality()){
            	// paths
            	Path tmp = this.path_R;
            	this.path_R = this.path_S;
            	this.path_S = tmp;
            	// columns
            	int tmpCol = this.colSampledR;
            	this.colSampledR = this.colSampledS;
            	this.colSampledS = tmpCol;
            	
            	//TODO a factory for the samplers
            	objSamplerR = samplerFactory(this.path_R, "SysSmp", this.percentageSizeR, this.colSampledR);
                objSamplerS = samplerFactory(this.path_S, "Cluster", this.percentageSizeS, this.colSampledS);
                
                // Sampling data from relation S
                // TODO feels weird having to cast the object back into what it is
                if(ToolRunner.run((ClusterSampler)objSamplerS,this.execMode)!=0) return -1;
                if(ToolRunner.run((SystematicSampler)objSamplerR,this.execMode)!=0) return -1;
                
                //samplesS = objSamplerS.getSample();
                
                R1FileStats = new FileStats(this.path_R, inf, objSamplerR.getJobObj());
                R2FileStats = new FileStats(this.path_S, inf, objSamplerS.getJobObj());
            }
           
            samplesS = objSamplerS.getSample();
            
            // how many matches we consider as a reasonable quantity
            setMaxNumMatches(R1FileStats.getApproxCardinality(), R2FileStats.getApproxCardinality());
            
            //int returnCode = ToolRunner.run(new JoinEstimateExec(), args);
            this.total_match = 0;
            this.total_sample = 0;
            
            while(stopCriteria(this.total_match,  this.total_sample, true)){
               
            	// solo se muestrea de una de las relaciones entonces de la otra su muestreo tiene q ser mayor
            	// para eso se usa SAMPLE_RATIO, y de esa hacemos clusterSampling, entonces vamos muestreando
            	// sistematicamente de R y comparando con la muestra cluster de S
            	
            	// Sampling data from relation R
            	
            	samplesR = objSamplerR.getSample();

            	// int returnCode = ToolRunner.run(new objSamplerR.getClass()(), args);
            	
                // count tuples from R that match with sample tuples from S
                this.total_match += countMatches();
                
                // keeping track of how many tuples are needed to satisfy the stopCriteria
                this.total_sample += samplesR.length;
            }
           
            pSelectivity_Estimate = this.total_match / (this.total_sample * R2FileStats.getApproxCardinality());
           if(pSelectivity_Estimate == 0)
        	   System.out.println(this.path_R.toString() + " - " + this.path_S.toString() + " colR "+ String.valueOf(this.getColSampledR()) + " colS " + String.valueOf(this.getColSampledS()));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return pSelectivity_Estimate;
    }
    
    /**
     * Method that will compare samples taken from relations R and S.
     * This assumes that all
     * @return the number of matches between samples.
     */
    public long countMatches(){
   	
    	long cntMatch = 0;
        // TODO Sorting in memory might not be the best solution
    	if (samplesR.length > samplesS.length){
    		Arrays.sort(samplesS);
    		for(Object objR : samplesR)
    			if(binarySearch(samplesS,objR)>=0)
    				cntMatch++;
    	}
    	else{
    		Arrays.sort(samplesR);
    		for(Object objS : samplesS)
    			if(binarySearch(samplesR,objS)>=0)
    				cntMatch++;
    	}
    		
//    	for(Object objR : samplesR){
//    		for(Object objS: samplesS)
//    			 if (objS.equals(objR))
//    				 cntMatch++;
//    	}
//       
        return cntMatch;
    }
    
  
    /**
     * Performs the standard binary search
     * using two comparisons per level.
     * @return index where item is found, or NOT_FOUND.
     */
    public static int binarySearch( Object [ ] a, Object x )
    {
        int low = 0;
        int high = a.length - 1;
        int mid;

        while( low <= high )
        {
            mid = ( low + high ) / 2;

            if( a[ mid ].toString().compareTo(x.toString() ) < 0 )
                low = mid + 1;
            else if( a[ mid ].toString().compareTo(x.toString() ) > 0 )
                high = mid - 1;
            else
                return mid;
        }

        return -1;
    }
    
    /**
	 * stopCriteria based on Lipton and Naughton's method.
	 * This is the case in which a reasonable number of Sr
	 * have non-empty ��Sr.
	 * **********************************************************
	 *  y > k1 * b * (1+e)/pow(e,2) where
	 * 'y' is the number of qualified tuples accumulated so far,
	 * 'k1' is a value associated with a given confidence level,
	 * 'b' is the maximum size of all ��Sr, and
	 * 'e' is the desired limit of a relative error
	 * **********************************************************
	 * 
	 * SANITY BOUNDS for Skewed Data and Small Queries
	 * The solution is to guarantee instead that the error will
	 * be at most some fixed fraction of the worst-case size. In
	 * essence, if the answer is small relative to the problem,
	 * space, we sample enough to guarantee that the answer is 
	 * indeed small. Small fraction -> Amax=(Query Size) / e 
	 * **********************************************************
	 * @param pTotalMatch	total match number required
	 * @return
	 */
	public boolean stopCriteria(long pTotalMatch, long pTotalSample, boolean flgConf){
		/// maybe we can set the buffer max size like the maximum number of tuples we want to sample to check
		/// join estimatives, we are using the MAX_NUM_MATCHES as the maximum number of tuples that will be held
		double k1 = (flgConf)?getConfidenceValKWithCLT(this.confLevel):getConfidenceValKWithoutCLT(this.confLevel);
		double k2 = (flgConf)?getConfidenceValK2WithCLT(this.confLevel):getConfidenceValK2WithoutCLT(this.confLevel);
		// this means that at most third part of the query size will be taken into account for deciding how much to sample
		int sanity_e = 3;
		if (pTotalMatch > (k1*MAX_NUM_MATCHES*((1+DEFAULT_ERROR)/Math.pow(DEFAULT_ERROR,2)))
			|| // SANITY BOUNDS -- for not sampling more than the query size
				pTotalSample > k2*Math.pow(sanity_e, 2))
			return false;
			
		return true;
		
	}
	/**
	 * The maximum number of matches allowed should be a
	 * percentage of the join worst case (a Cartesian product)
	 * ****************************************************************
	 * maybe we can set the buffer max size like the maximum number of tuples we want to sample to check
	 * join estimatives, we are using the MAX_NUM_MATCHES as the maximum number of tuples that will be held
	 * 
	 */
	public static void setMaxNumMatches(double d, double e){
		MAX_NUM_MATCHES = Math.ceil(MAX_PERCEN_NUM_MATCHES * d * e);
		//MAX_NUM_MATCHES = 1000;
	}
	
	/**
	 * NOTE: ONLY FOR NUMERIC ATTRIBUTES
	 * @param sampleR	Array containing the samples from relation R.
	 * @return the sum of all objects sampled.
	 */
    public double getSampleSum(Object[] sampleR){
        
    	double sum = 0.0;       
        
    	// ONLY FOR NUMERIC ATTRIBUTES
        for(Object objSampled: sampleR){
            sum += new Double(objSampled.toString());
        }
       
        return sum;
    }
    
    // ONLY FOR NUMERIC ATTRIBUTES
    // TODO: assuming that CLA refers to the normal distribution
    //		 and that the inverse of the cumulative distribution function
    //		 is the quantile function or probit function and is expressed
    //		 in terms of the inverse error function.
    public double getConfidenceValKWithCLT(double paramP){
    	
    	double valP = (1+Math.sqrt(paramP))/2;
    	valP = CDF_Normal.xnormi(valP);
    	
    	return Math.pow(valP, 2);
    }
    
    // THEOREM 3.1 from "Practical Selectivity Estimation through Adaptive Sampling"
    // Suppose that in a run of the algorithm, the while loop terminates
    // because m > k2*pow(e,2). Then for 0 <= p < 1, if k2 >= 1/(1-p)
    // The error in �� is less than Amax/e of A with probability 'p'
    public double getConfidenceValK2WithoutCLT(double paramP){
    	return 1.0/(1.0-paramP);
    }
    
    // THEOREM 3.2 from "Practical Selectivity Estimation through Adaptive Sampling"
    // Suppose that in a run of the algorithm, the while loop terminates
    // because m > k2*pow(e,2), and suppose that the central limit 
    // approximation appies to the samples. Then for 0 <= p < 1, if
    // k2 >= pow(PHI_INV((1+p)/2),2), the error �� is less than Amax/e
    // of A with probability p
    public double getConfidenceValK2WithCLT(double paramP){
    	double valP = CDF_Normal.xnormi((paramP+1.0)/2.0);
    	
    	return Math.pow(valP, 2);
    }
    /**
     * Method to set the execution mode of the samplers.
     * @param pExecMode
     */
    public void setExecMode(String pExecMode){
    	this.execMode[0] = pExecMode;
    }
    
   /**
    * @param paramP
    * @return 	confidence value working without Central Limit Theorem
    */
    public double getConfidenceValKWithoutCLT(double paramP){
       
        return 1 / (1-Math.sqrt(paramP));
    }
    
    /**
     * Getter of the samplesR object.
     * @return samplesR object.
     */
    public Object[] getSamplesR(){
    	return this.samplesR;
    }

	/**
	 * @param colSampledR the colSampledR to set
	 */
	public void setColSampledR(int colSampledR) {
		this.colSampledR = colSampledR;
	}

	/**
	 * @return the colSampledR
	 */
	public int getColSampledR() {
		return colSampledR;
	}

	/**
	 * @param colSampledS the colSampledS to set
	 */
	public void setColSampledS(int colSampledS) {
		this.colSampledS = colSampledS;
	}

	/**
	 * @return the colSampledS
	 */
	public int getColSampledS() {
		return colSampledS;
	}
    
}