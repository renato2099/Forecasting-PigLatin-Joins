Meta VERSION="1" .
Job JOBID="job_201105280114_0053" JOBNAME="PigLatin:23H00M22S889488089\.3X\.query\.33\.date_dim\.date_dim\.1\.1\.pig" USER="hadoop" SUBMIT_TIME="1306565883216" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105280114_0053/job\.xml" .
Job JOBID="job_201105280114_0053" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105280114_0053" LAUNCH_TIME="1306565883468" TOTAL_MAPS="1" TOTAL_REDUCES="1" JOB_STATUS="PREP" .
Task TASKID="task_201105280114_0053_m_000002" TASK_TYPE="SETUP" START_TIME="1306565885492" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105280114_0053_m_000002" TASK_ATTEMPT_ID="attempt_201105280114_0053_m_000002_0" START_TIME="1306565885894" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:49715" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105280114_0053_m_000002" TASK_ATTEMPT_ID="attempt_201105280114_0053_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306565887014" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105280114_0053_m_000002" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306565888496" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105280114_0053" JOB_STATUS="RUNNING" .
Task TASKID="task_201105280114_0053_m_000000" TASK_TYPE="MAP" START_TIME="1306565888497" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105280114_0053_m_000000" TASK_ATTEMPT_ID="attempt_201105280114_0053_m_000000_0" START_TIME="1306565888531" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:49715" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105280114_0053_m_000000" TASK_ATTEMPT_ID="attempt_201105280114_0053_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306565890411" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(131072)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(172)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(MAP_OUTPUT_BYTES)(Map output bytes)(132)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(1)]}" .
Task TASKID="task_201105280114_0053_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306565891501" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(131072)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(172)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(MAP_OUTPUT_BYTES)(Map output bytes)(132)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(1)]}" .
Task TASKID="task_201105280114_0053_r_000000" TASK_TYPE="REDUCE" START_TIME="1306565891502" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105280114_0053_r_000000" TASK_ATTEMPT_ID="attempt_201105280114_0053_r_000000_0" START_TIME="1306565891524" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:49715" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105280114_0053_r_000000" TASK_ATTEMPT_ID="attempt_201105280114_0053_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306565898900" SORT_FINISHED="1306565898972" FINISH_TIME="1306565901253" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(140)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(140)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(127)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(1)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(140)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(1)]}" .
Task TASKID="task_201105280114_0053_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306565903509" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(140)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(140)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(127)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(1)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(140)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(1)][(SPILLED_RECORDS)(Spilled Records)(1)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(1)]}" .
Task TASKID="task_201105280114_0053_m_000001" TASK_TYPE="CLEANUP" START_TIME="1306565903510" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105280114_0053_m_000001" TASK_ATTEMPT_ID="attempt_201105280114_0053_m_000001_0" START_TIME="1306565903552" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:49715" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105280114_0053_m_000001" TASK_ATTEMPT_ID="attempt_201105280114_0053_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306565904557" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105280114_0053_m_000001" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306565906514" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105280114_0053" FINISH_TIME="1306565906514" JOB_STATUS="SUCCESS" FINISHED_MAPS="1" FINISHED_REDUCES="1" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(1)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(1)][(DATA_LOCAL_MAPS)(Data-local map tasks)(1)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(140)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(131072)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(312)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(127)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(1)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(140)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(1)][(SPILLED_RECORDS)(Spilled Records)(2)][(MAP_OUTPUT_BYTES)(Map output bytes)(132)][(MAP_OUTPUT_RECORDS)(Map output records)(1)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(1)]}" .
