Meta VERSION="1" .
Job JOBID="job_201105251513_0072" JOBNAME="PigLatin:22H55M55S045611284\.5X\.query\.11\.date_dim\.store_returns\.1\.1\.pig" USER="hadoop" SUBMIT_TIME="1306353061192" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0072/job\.xml" .
Job JOBID="job_201105251513_0072" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0072" LAUNCH_TIME="1306353061360" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0072_m_000003" TASK_TYPE="SETUP" START_TIME="1306353061852" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0072_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000003_0" START_TIME="1306352080861" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0072_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352081972" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0072_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353064874" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0072" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0072_m_000000" TASK_TYPE="MAP" START_TIME="1306353064875" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0072_m_000001" TASK_TYPE="MAP" START_TIME="1306353066537" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0072_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000001_0" START_TIME="1306352557397" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0072_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352561082" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1095803)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(949637)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0072_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353072543" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1095803)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(949637)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0072_r_000000" TASK_TYPE="REDUCE" START_TIME="1306353072544" SPLITS="" .
Task TASKID="task_201105251513_0072_r_000001" TASK_TYPE="REDUCE" START_TIME="1306353072999" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0072_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000000_0" START_TIME="1306352083564" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0072_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352089992" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272730)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697634)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105251513_0072_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353073888" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272730)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697634)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0072_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0072_r_000000_0" START_TIME="1306352563215" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0072_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0072_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306352570399" SORT_FINISHED="1306352570900" FINISH_TIME="1306352575392" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2743763)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2743763)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2224800)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36526)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2743769)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139050)][(SPILLED_RECORDS)(Spilled Records)(185587)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(185587)]}" .
Task TASKID="task_201105251513_0072_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306353087562" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2743763)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2743763)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2224800)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36526)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2743769)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139050)][(SPILLED_RECORDS)(Spilled Records)(185587)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(185587)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0072_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0072_r_000001_0" START_TIME="1306353073337" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0072_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0072_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306353080443" SORT_FINISHED="1306353081012" FINISH_TIME="1306353085597" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2624646)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2624646)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2215232)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2624652)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138452)][(SPILLED_RECORDS)(Spilled Records)(174976)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(174976)]}" .
Task TASKID="task_201105251513_0072_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306353088009" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2624646)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2624646)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2215232)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2624652)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138452)][(SPILLED_RECORDS)(Spilled Records)(174976)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(174976)]}" .
Task TASKID="task_201105251513_0072_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306353088010" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0072_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000002_0" START_TIME="1306353088081" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0072_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0072_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306353089343" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0072_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353091013" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0072" FINISH_TIME="1306353091013" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(5368409)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(43027443)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(10736942)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(4440032)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(73050)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(360563)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(5368421)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(277502)][(SPILLED_RECORDS)(Spilled Records)(721126)][(MAP_OUTPUT_BYTES)(Map output bytes)(4647271)][(MAP_OUTPUT_RECORDS)(Map output records)(360563)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(360563)]}" .
