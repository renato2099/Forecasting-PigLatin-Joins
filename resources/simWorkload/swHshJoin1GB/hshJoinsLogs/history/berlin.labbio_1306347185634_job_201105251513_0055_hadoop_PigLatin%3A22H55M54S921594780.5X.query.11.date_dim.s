Meta VERSION="1" .
Job JOBID="job_201105251513_0055" JOBNAME="PigLatin:22H55M54S921594780\.5X\.query\.11\.date_dim\.store_returns\.1\.1\.pig" USER="hadoop" SUBMIT_TIME="1306352291905" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0055/job\.xml" .
Job JOBID="job_201105251513_0055" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0055" LAUNCH_TIME="1306352292114" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0055_m_000003" TASK_TYPE="SETUP" START_TIME="1306352294216" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0055_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000003_0" START_TIME="1306351785087" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0055_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306351786275" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0055_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306352297220" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0055" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0055_m_000000" TASK_TYPE="MAP" START_TIME="1306352297220" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0055_m_000001" TASK_TYPE="MAP" START_TIME="1306352297879" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0055_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000000_0" START_TIME="1306351787850" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0055_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306351793380" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272730)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697634)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105251513_0055_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306352303226" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272730)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697634)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105251513_0055_r_000000" TASK_TYPE="REDUCE" START_TIME="1306352303227" SPLITS="" .
Task TASKID="task_201105251513_0055_r_000001" TASK_TYPE="REDUCE" START_TIME="1306352303884" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0055_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000001_0" START_TIME="1306352298226" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0055_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352302253" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1095803)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(949637)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0055_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306352303886" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1095803)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(949637)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0055_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0055_r_000000_0" START_TIME="1306351793830" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0055_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0055_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306351801005" SORT_FINISHED="1306351801520" FINISH_TIME="1306351806050" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2743763)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2743763)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2224800)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36526)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2743769)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139050)][(SPILLED_RECORDS)(Spilled Records)(185587)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(185587)]}" .
Task TASKID="task_201105251513_0055_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306352318247" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2743763)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2743763)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2224800)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36526)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2743769)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139050)][(SPILLED_RECORDS)(Spilled Records)(185587)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(185587)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0055_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0055_r_000001_0" START_TIME="1306351322837" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0055_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0055_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306351330044" SORT_FINISHED="1306351330620" FINISH_TIME="1306351335185" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2624646)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2624646)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2215232)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2624652)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138452)][(SPILLED_RECORDS)(Spilled Records)(174976)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(174976)]}" .
Task TASKID="task_201105251513_0055_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306352318897" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2624646)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2624646)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2215232)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2624652)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138452)][(SPILLED_RECORDS)(Spilled Records)(174976)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(174976)]}" .
Task TASKID="task_201105251513_0055_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306352318898" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0055_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000002_0" START_TIME="1306351337503" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0055_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0055_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306351338657" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0055_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306352321902" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0055" FINISH_TIME="1306352321903" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(5368409)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(43027443)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(10736942)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(4440032)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(73050)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(360563)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(5368421)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(277502)][(SPILLED_RECORDS)(Spilled Records)(721126)][(MAP_OUTPUT_BYTES)(Map output bytes)(4647271)][(MAP_OUTPUT_RECORDS)(Map output records)(360563)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(360563)]}" .