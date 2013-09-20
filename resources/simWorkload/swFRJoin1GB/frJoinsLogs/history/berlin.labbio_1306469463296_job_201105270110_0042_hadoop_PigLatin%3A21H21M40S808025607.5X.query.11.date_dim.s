Meta VERSION="1" .
Job JOBID="job_201105270110_0042" JOBNAME="PigLatin:21H21M40S808025607\.5X\.query\.11\.date_dim\.store_returns\.1\.1\.pig" USER="hadoop" SUBMIT_TIME="1306472084471" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105270110_0042/job\.xml" .
Job JOBID="job_201105270110_0042" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105270110_0042" LAUNCH_TIME="1306472084652" TOTAL_MAPS="1" TOTAL_REDUCES="0" JOB_STATUS="PREP" .
Task TASKID="task_201105270110_0042_m_000002" TASK_TYPE="SETUP" START_TIME="1306472085465" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105270110_0042_m_000002" TASK_ATTEMPT_ID="attempt_201105270110_0042_m_000002_0" START_TIME="1306472085776" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:54274" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105270110_0042_m_000002" TASK_ATTEMPT_ID="attempt_201105270110_0042_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306472087095" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105270110_0042_m_000002" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306472088469" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105270110_0042" JOB_STATUS="RUNNING" .
Task TASKID="task_201105270110_0042_m_000000" TASK_TYPE="MAP" START_TIME="1306472088470" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105270110_0042_m_000000" TASK_ATTEMPT_ID="attempt_201105270110_0042_m_000000_0" START_TIME="1306472088503" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:54274" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105270110_0042_m_000000" TASK_ATTEMPT_ID="attempt_201105270110_0042_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306472094716" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(3726530)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(4440032)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(277502)]}" .
Task TASKID="task_201105270110_0042_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306472097479" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(3726530)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(4440032)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(277502)]}" .
Task TASKID="task_201105270110_0042_m_000001" TASK_TYPE="CLEANUP" START_TIME="1306472097480" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105270110_0042_m_000001" TASK_ATTEMPT_ID="attempt_201105270110_0042_m_000001_0" START_TIME="1306472097499" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:54274" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105270110_0042_m_000001" TASK_ATTEMPT_ID="attempt_201105270110_0042_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306472098412" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105270110_0042_m_000001" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306472100484" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105270110_0042" FINISH_TIME="1306472100484" JOB_STATUS="SUCCESS" FINISHED_MAPS="1" FINISHED_REDUCES="0" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(1)][(DATA_LOCAL_MAPS)(Data-local map tasks)(1)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(3726530)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(4440032)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(277502)]}" .