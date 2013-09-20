package labbio.projects.hadoop.estimates.join;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

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
 * The Central Limit Theorem states that given a distribution with a mean μ and variance σ²,
 * the sampling distribution of the mean approaches a  normal distribution with a mean (μ) 
 * and a variance σ²/N as N, the  sample size, increases.
 * *************
 * 
 * @author rmogrovejo
 */
public class RawJoinEstimate {
     
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
     * 'e' the desired limit of a relative error.
     */
    private static final double DEFAULT_ERROR = 0.1;
    
    /**
     * ¬Sr	-> tuples in Sr that satisfy the qualification F.
     * 		-> tuples that satisfy the join condition.
	 * 'b' is the maximum size of all ¬Sr.
	 * represents a percentage of the worst case of the join
	 * (a percentage of the Cartesian product)
	 */
    private static double MAX_PERCEN_NUM_MATCHES = 0.1;
    private static double MAX_NUM_MATCHES = 1000;
    
    /**
     * Percentage that will be read from the relation.
     */
    private final static double DEFAULT_SAMPLE_PERCENTAGE = 0.01;
    
    /**
     * Confidence level with which the stopping point will be built.
     */
    private final static double DEFAULT_CONFIDENCE_LEVEL = 0.99;
    
    /**
     * This represents how much of relation 'S' will taken compared to relation 'R'.
     */
    private final static double SAMPLE_RATIO = 0.5;
    
    /**
     * Execution mode. true -> local. false -> distributed.
     */
    private String []execMode = {"true"};
    
    /**
     * Default constructor to set PathR1 and PathR2.
     */
    public RawJoinEstimate(Path pPathR1, Path pPathR2){
        this(DEFAULT_CONFIDENCE_LEVEL, MAX_PERCEN_NUM_MATCHES, DEFAULT_SAMPLE_PERCENTAGE, pPathR1, pPathR2);
    }
   
    /**
     * Constructor with parameters to set pSampleSize, PathR1 and PathR2.
     * @param pPathR1
     * @param pPathR2
     * @param pSampleSize
     */
    public RawJoinEstimate(Path pPathR1, Path pPathR2, double pSampleSize){
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
    public RawJoinEstimate(double pConfLevel, double pMaxPercenMatch, double pSampleSize, Path pPathR1, Path pPathR2){
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

    public double getRawJoinEstimate(){
       
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
            
            samplesS = objSamplerS.getSample();
            
            FileStats R1FileStats = new FileStats(this.path_R, inf, objSamplerR.getJobObj());
            FileStats R2FileStats = new FileStats(this.path_S, inf, objSamplerS.getJobObj());

        	// Sampling data from relation R
        	samplesR = objSamplerR.getSample();
        	
        	long numberDistValR = getNumOfDistinctVals(samplesR);
        	long numberDistValS = getNumOfDistinctVals(samplesS);
        	
            pSelectivity_Estimate = 1.0 / (Math.max(numberDistValR, numberDistValS));
           
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
    * @param paramP
    * @return 	confidence value working without Central Limit Theorem
    */
    public long getNumOfDistinctVals(Object[] pSamples){
        return (Union((Collection)Arrays.asList(pSamples), (Collection)Arrays.asList(pSamples))).size();
    }
    
    public static Collection Union(Collection coll1, Collection coll2)
    {
        Set union = new HashSet(coll1);
        union.addAll(coll1);
        union.addAll(new HashSet(coll2));
        return union;
    }
    
    /**
     * Method to set the execution mode of the samplers.
     * @param pExecMode
     */
    public void setExecMode(String pExecMode){
    	this.execMode[0] = pExecMode;
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