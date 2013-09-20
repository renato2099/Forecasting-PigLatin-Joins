Meta VERSION="1" .
Job JOBID="job_201105280114_0021" JOBNAME="PigLatin:23H00M22S806215688\.3X\.query\.31\.web_page\.web_page\.1\.1\.pig" USER="hadoop" SUBMIT_TIME="1306557755608" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105280114_0021/job\.xml" .
Job JOBID="job_201105280114_0021" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105280114_0021" LAUNCH_TIME="1306557755936" TOTAL_MAPS="1" TOTAL_REDUCES="1" JOB_STATUS="PREP" .
Task TASKID="task_201105280114_0021_m_000002" TASK_TYPE="SETUP" START_TIME="1306557756089" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105280114_0021_m_000002" TASK_ATTEMPT_ID="attempt_201105280114_0021_m_000002_0" START_TIME="1306557256308" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:33939" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105280114_0021_m_000002" TASK_ATTEMPT_ID="attempt_201105280114_0021_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306557257387" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105280114_0021_m_000002" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306557759093" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105280114_0021" JOB_STATUS="RUNNING" .
Task TASKID="task_201105280114_0021_m_000000" TASK_TYPE="MAP" START_TIME="1306557759094" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105280114_0021_m_000000" TASK_ATTEMPT_ID="attempt_201105280114_0021_m_000000_0" START_TIME="1306557259094" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:33939" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105280114_0021_m_000000" TASK_ATTEMPT_ID="attempt_201105280114_0021_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306557260753" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5776)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(172)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(MAP_OUTPUT_BYTES)(Map output bytes)(132)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(1)]}" .
Task TASKID="task_201105280114_0021_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306557762099" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5776)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(172)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(MAP_OUTPUT_BYTES)(Map output bytes)(132)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(1)]}" .
Task TASKID="task_201105280114_0021_r_000000" TASK_TYPE="REDUCE" START_TIME="1306557762100" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105280114_0021_r_000000" TASK_ATTEMPT_ID="attempt_201105280114_0021_r_000000_0" START_TIME="1306557262115" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:33939" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105280114_0021_r_000000" TASK_ATTEMPT_ID="attempt_201105280114_0021_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306557269307" SORT_FINISHED="1306557269342" FINISH_TIME="1306557271572" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(140)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(140)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(127)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(1)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(140)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(1)]}" .
Task TASKID="task_201105280114_0021_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306557774118" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(140)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(140)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(127)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(1)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(140)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(1)]}" .
Task TASKID="task_201105280114_0021_m_000001" TASK_TYPE="CLEANUP" START_TIME="1306557774119" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105280114_0021_m_000001" TASK_ATTEMPT_ID="attempt_201105280114_0021_m_000001_0" START_TIME="1306557274113" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:33939" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105280114_0021_m_000001" TASK_ATTEMPT_ID="attempt_201105280114_0021_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306557274512" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105280114_0021_m_000001" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306557777123" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105280114_0021" FINISH_TIME="1306557777123" JOB_STATUS="SUCCESS" FINISHED_MAPS="1" FINISHED_REDUCES="1" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(1)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(1)][(DATA_LOCAL_MAPS)(Data-local map tasks)(1)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(140)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5776)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(312)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(127)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(1)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(140)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(1)][(SPILLED_RECORDS)(Spilled Records)(2)][(MAP_OUTPUT_BYTES)(Map output bytes)(132)][(MAP_OUTPUT_RECORDS)(Map output records)(1)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(1)]}" .