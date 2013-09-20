package labbio.projects.hadoop.log.xmlparser;

import java.util.ArrayList;

import labbio.projects.hadoop.log.webparser.HadoopStatsScrapper;

/**
 * Class used to parse Hadoop Statistics
 * @author renatomarroquin
 */
public class HadoopStatsParserExec {

	public static String parseParams[] = { /*"TOTAL_LAUNCHED_REDUCES",*/
		/*"Launched map tasks"*/"TOTAL_LAUNCHED_MAPS", /*"FILE_BYTES_READ",*/"HDFS_BYTES_READ","MAP_INPUT_RECORDS"/*"Map input records"*/};
	//we have to use the name in capitals because they are the ones apart by two spaces
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HadoopStatsParser.setTargetParams(parseParams);
		HadoopStatsParser.parseJobResults();
		HadoopStatsParser.printJobResults();
		
	}
	
	/**
	 * Simple method to check if the line with the counter values is working properly.
	 */
	public void testParsingCounters(){
		HadoopStatsParser.setTargetParams(parseParams);
		String strLine = "Task TASKID=\"task_201105011614_0003_m_000000\" TASK_TYPE=\"MAP\" TASK_STATUS=\"SUCCESS\" FINISH_TIME=\"1304277600293\" COUNTERS=\"{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272714)]}{(org.apache.hadoop.mapred.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697618)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}\" .";
		ArrayList<Double> alTmp = HadoopStatsParser.getJobCounterValues(HadoopStatsParser.getInitializedArrayList(), strLine);
		for(double d : alTmp){
			System.out.println("Value:" + String.valueOf(d));
		}
	}

}
