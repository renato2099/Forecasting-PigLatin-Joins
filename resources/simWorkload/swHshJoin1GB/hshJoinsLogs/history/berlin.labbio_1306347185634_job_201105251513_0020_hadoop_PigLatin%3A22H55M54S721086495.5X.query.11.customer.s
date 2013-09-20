Meta VERSION="1" .
Job JOBID="job_201105251513_0020" JOBNAME="PigLatin:22H55M54S721086495\.5X\.query\.11\.customer\.store_returns\.1\.4\.pig" USER="hadoop" SUBMIT_TIME="1306350738508" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0020/job\.xml" .
Job JOBID="job_201105251513_0020" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0020" LAUNCH_TIME="1306350738665" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0020_m_000003" TASK_TYPE="SETUP" START_TIME="1306350738871" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0020_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000003_0" START_TIME="1306350229599" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0020_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306350230762" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0020_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306350741875" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0020" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0020_m_000000" TASK_TYPE="MAP" START_TIME="1306350741876" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0020_m_000001" TASK_TYPE="MAP" START_TIME="1306350742860" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0020_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000000_0" START_TIME="1306350232349" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0020_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306350237791" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272714)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697618)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105251513_0020_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306350747884" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272714)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697618)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105251513_0020_r_000000" TASK_TYPE="REDUCE" START_TIME="1306350747885" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0020_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000001_0" START_TIME="1306349761662" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0020_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306349765579" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(13209372)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1500068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(100000)][(SPILLED_RECORDS)(Spilled Records)(100000)][(MAP_OUTPUT_BYTES)(Map output bytes)(1300000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(100000)]}" .
Task TASKID="task_201105251513_0020_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306350748866" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(13209372)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1500068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(100000)][(SPILLED_RECORDS)(Spilled Records)(100000)][(MAP_OUTPUT_BYTES)(Map output bytes)(1300000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(100000)]}" .
Task TASKID="task_201105251513_0020_r_000001" TASK_TYPE="REDUCE" START_TIME="1306350748867" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0020_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0020_r_000001_0" START_TIME="1306349767334" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0020_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0020_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306349769512" SORT_FINISHED="1306349770372" FINISH_TIME="1306349773618" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2835381)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2835381)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1637688)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(50000)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2835387)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139025)][(SPILLED_RECORDS)(Spilled Records)(189025)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(189025)]}" .
Task TASKID="task_201105251513_0020_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306350757874" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2835381)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2835381)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1637688)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(50000)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2835387)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139025)][(SPILLED_RECORDS)(Spilled Records)(189025)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(189025)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0020_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0020_r_000000_0" START_TIME="1306350238354" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0020_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0020_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306350245637" SORT_FINISHED="1306350246185" FINISH_TIME="1306350251165" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2937277)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2937277)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1631136)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(50001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2937283)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138473)][(SPILLED_RECORDS)(Spilled Records)(198489)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(198489)]}" .
Task TASKID="task_201105251513_0020_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306350762898" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2937277)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2937277)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1631136)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(50001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2937283)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138473)][(SPILLED_RECORDS)(Spilled Records)(198489)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(198489)]}" .
Task TASKID="task_201105251513_0020_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306350762899" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0020_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000002_0" START_TIME="1306350253366" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0020_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0020_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306350254064" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0020_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306350765901" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0020" FINISH_TIME="1306350765902" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(5772658)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(45919377)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(11545440)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3268824)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(100001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(387514)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(5772670)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(277498)][(SPILLED_RECORDS)(Spilled Records)(775028)][(MAP_OUTPUT_BYTES)(Map output bytes)(4997618)][(MAP_OUTPUT_RECORDS)(Map output records)(387514)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(387514)]}" .
