package labbio.projects.hadoop.log.webparser;

import java.util.HashMap;

/**
 * Class used to scrap Hadoop statistics
 * @author renatomarroquin
 */
public class HadoopStatsScrapperExec {

	/**
     * The main program, which can be executed from the command line.
     * @param args A URL or file name to parse, and an optional tag name to be
     * used as a filter.
     */
    public static void main (String [] args)
    {
    	
    	HadoopStatsScrapper.setTargetParams(getHadoopParams());
    	String url="http://localhost:50030/jobdetails.jsp?jobid=";
    	String urlTasks="http://localhost:50030/jobtasks.jsp?jobid=";
    	//TODO this word is after the word hadoop, so it can be obtained from there or from the main page

    	String Id = "201104232103_";
    	String jobId = "job_".concat(Id);
    	HadoopStatsScrapper.setScrappingScope();
    	HadoopStatsScrapper.scrapHadoopWeb();
    	
    	HadoopStatsScrapper.mParametersHashMap = new HashMap<String, HashMap>();
    	HadoopStatsScrapper.scrapHadoopWeb(url, urlTasks, Id);
    	
    	HashMap x = HadoopStatsScrapper.mParametersHashMap;
    	
    }

    public static String[] getHadoopParams(){
    	
    	String hadoopParams[] = {"Launched map tasks",
    			"Launched reduce tasks",
    			"FILE_BYTES_READ","HDFS_BYTES_READ","Map input records"};
    	
    	return hadoopParams;
    	//,"Data-local map tasks"
    	//mParamsNames.add("Job Name:");
    	//mParamsNames.add("Launched reduce tasks");
    	//mParamsNames.add("Launched map tasks");
    	//mParamsNames.add("Data-local map tasks");
    	//mParamsNames.add("FILE_BYTES_READ");
    	//mParamsNames.add("HDFS_BYTES_READ");
    	//    	mParamsNames.add("FILE_BYTES_WRITTEN");
    	//    	mParamsNames.add("Reduce input groups");
    	//    	mParamsNames.add("Combine output records");
    	//    	mParamsNames.add("Map input records");
    	//    	mParamsNames.add("Reduce shuffle bytes");
    	//    	mParamsNames.add("Reduce output records");
    	//    	mParamsNames.add("Spilled Records");
    	//    	mParamsNames.add("Map output bytes");
    	//    	mParamsNames.add("Map output records");
    	//    	mParamsNames.add("Combine input records");
    	//    	mParamsNames.add("Reduce input records");
    }
}
