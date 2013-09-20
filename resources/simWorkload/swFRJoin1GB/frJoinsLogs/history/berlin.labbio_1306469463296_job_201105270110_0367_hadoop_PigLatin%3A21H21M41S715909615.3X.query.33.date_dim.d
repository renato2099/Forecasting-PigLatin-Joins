Meta VERSION="1" .
Job JOBID="job_201105270110_0367" JOBNAME="PigLatin:21H21M41S715909615\.3X\.query\.33\.date_dim\.date_dim\.2\.2\.pig" USER="hadoop" SUBMIT_TIME="1306483073217" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105270110_0367/job\.xml" .
Job JOBID="job_201105270110_0367" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105270110_0367" LAUNCH_TIME="1306483073378" TOTAL_MAPS="1" TOTAL_REDUCES="0" JOB_STATUS="PREP" .
Task TASKID="task_201105270110_0367_m_000002" TASK_TYPE="SETUP" START_TIME="1306483073429" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105270110_0367_m_000002" TASK_ATTEMPT_ID="attempt_201105270110_0367_m_000002_0" START_TIME="1306482102722" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:41979" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105270110_0367_m_000002" TASK_ATTEMPT_ID="attempt_201105270110_0367_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306482103844" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105270110_0367_m_000002" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306483076433" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105270110_0367" JOB_STATUS="RUNNING" .
Task TASKID="task_201105270110_0367_m_000000" TASK_TYPE="MAP" START_TIME="1306483076434" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105270110_0367_m_000000" TASK_ATTEMPT_ID="attempt_201105270110_0367_m_000000_0" START_TIME="1306482105446" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:41979" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105270110_0367_m_000000" TASK_ATTEMPT_ID="attempt_201105270110_0367_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306482109099" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1972323)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105270110_0367_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306483082444" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1972323)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105270110_0367_m_000001" TASK_TYPE="CLEANUP" START_TIME="1306483082445" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105270110_0367_m_000001" TASK_ATTEMPT_ID="attempt_201105270110_0367_m_000001_0" START_TIME="1306482111440" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:41979" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105270110_0367_m_000001" TASK_ATTEMPT_ID="attempt_201105270110_0367_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306482112070" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105270110_0367_m_000001" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306483085449" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105270110_0367" FINISH_TIME="1306483085450" JOB_STATUS="SUCCESS" FINISHED_MAPS="1" FINISHED_REDUCES="0" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(1)][(DATA_LOCAL_MAPS)(Data-local map tasks)(1)]}{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1972323)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .