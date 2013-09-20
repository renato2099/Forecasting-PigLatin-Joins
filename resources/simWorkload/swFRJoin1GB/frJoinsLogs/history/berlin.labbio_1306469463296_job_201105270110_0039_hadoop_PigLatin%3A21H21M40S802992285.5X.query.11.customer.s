Meta VERSION="1" .
Job JOBID="job_201105270110_0039" JOBNAME="PigLatin:21H21M40S802992285\.5X\.query\.11\.customer\.store_returns\.1\.4\.pig" USER="hadoop" SUBMIT_TIME="1306472014603" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105270110_0039/job\.xml" .
Job JOBID="job_201105270110_0039" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105270110_0039" LAUNCH_TIME="1306472014756" TOTAL_MAPS="1" TOTAL_REDUCES="0" JOB_STATUS="PREP" .
Task TASKID="task_201105270110_0039_m_000002" TASK_TYPE="SETUP" START_TIME="1306472016344" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105270110_0039_m_000002" TASK_ATTEMPT_ID="attempt_201105270110_0039_m_000002_0" START_TIME="1306472016663" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:54274" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105270110_0039_m_000002" TASK_ATTEMPT_ID="attempt_201105270110_0039_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306472017704" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105270110_0039_m_000002" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306472019347" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105270110_0039" JOB_STATUS="RUNNING" .
Task TASKID="task_201105270110_0039_m_000000" TASK_TYPE="MAP" START_TIME="1306472019348" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105270110_0039_m_000000" TASK_ATTEMPT_ID="attempt_201105270110_0039_m_000000_0" START_TIME="1306472019378" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:54274" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105270110_0039_m_000000" TASK_ATTEMPT_ID="attempt_201105270110_0039_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306472026023" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3697618)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105270110_0039_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306472028356" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3697618)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105270110_0039_m_000001" TASK_TYPE="CLEANUP" START_TIME="1306472028356" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105270110_0039_m_000001" TASK_ATTEMPT_ID="attempt_201105270110_0039_m_000001_0" START_TIME="1306472028379" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:54274" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105270110_0039_m_000001" TASK_ATTEMPT_ID="attempt_201105270110_0039_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306472029641" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105270110_0039_m_000001" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306472031360" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105270110_0039" FINISH_TIME="1306472031361" JOB_STATUS="SUCCESS" FINISHED_MAPS="1" FINISHED_REDUCES="0" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(1)][(DATA_LOCAL_MAPS)(Data-local map tasks)(1)]}{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3697618)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .