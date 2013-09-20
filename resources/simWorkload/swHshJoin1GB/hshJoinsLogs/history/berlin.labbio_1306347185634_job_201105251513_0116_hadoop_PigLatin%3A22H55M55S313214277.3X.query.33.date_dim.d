Meta VERSION="1" .
Job JOBID="job_201105251513_0116" JOBNAME="PigLatin:22H55M55S313214277\.3X\.query\.33\.date_dim\.date_dim\.2\.2\.pig" USER="hadoop" SUBMIT_TIME="1306369449164" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0116/job\.xml" .
Job JOBID="job_201105251513_0116" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0116" LAUNCH_TIME="1306369449551" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0116_m_000003" TASK_TYPE="SETUP" START_TIME="1306369449555" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0116_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000003_0" START_TIME="1306369449825" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0116_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306369451065" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0116_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369452559" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0116" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0116_m_000000" TASK_TYPE="MAP" START_TIME="1306369452559" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0116_m_000001" TASK_TYPE="MAP" START_TIME="1306369453423" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0116_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000000_0" START_TIME="1306369452604" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0116_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306369456676" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0116_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369458565" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0116_r_000000" TASK_TYPE="REDUCE" START_TIME="1306369458566" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0116_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000001_0" START_TIME="1306368945722" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0116_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306368949437" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0116_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369459434" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0116_r_000001" TASK_TYPE="REDUCE" START_TIME="1306369459435" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0116_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0116_r_000000_0" START_TIME="1306369458588" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0116_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0116_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306369465981" SORT_FINISHED="1306369466371" FINISH_TIME="1306369471205" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045406)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045406)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241850)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36525)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2045412)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36525)][(SPILLED_RECORDS)(Spilled Records)(73050)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73050)]}" .
Task TASKID="task_201105251513_0116_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306369473575" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045406)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045406)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241850)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36525)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2045412)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36525)][(SPILLED_RECORDS)(Spilled Records)(73050)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73050)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0116_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0116_r_000001_0" START_TIME="1306368951518" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0116_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0116_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306368958766" SORT_FINISHED="1306368959119" FINISH_TIME="1306368963655" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045350)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045350)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241816)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2045356)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36524)][(SPILLED_RECORDS)(Spilled Records)(73048)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73048)]}" .
Task TASKID="task_201105251513_0116_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306369474447" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045350)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045350)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241816)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2045356)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36524)][(SPILLED_RECORDS)(Spilled Records)(73048)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73048)]}" .
Task TASKID="task_201105251513_0116_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306369474448" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0116_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000002_0" START_TIME="1306368966530" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0116_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0116_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306368967640" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0116_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369477451" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0116" FINISH_TIME="1306369477452" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(4090756)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(20634876)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(8181636)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2483666)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(73049)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(146098)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(4090768)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(73049)][(SPILLED_RECORDS)(Spilled Records)(292196)][(MAP_OUTPUT_BYTES)(Map output bytes)(3798548)][(MAP_OUTPUT_RECORDS)(Map output records)(146098)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(146098)]}" .