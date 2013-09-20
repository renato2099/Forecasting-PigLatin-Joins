Meta VERSION="1" .
Job JOBID="job_201105251513_0211" JOBNAME="PigLatin:22H55M55S812598616\.1X\.query\.6\.promotion\.item\.5\.1\.pig" USER="hadoop" SUBMIT_TIME="1306401142708" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0211/job\.xml" .
Job JOBID="job_201105251513_0211" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0211" LAUNCH_TIME="1306401142909" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0211_m_000003" TASK_TYPE="SETUP" START_TIME="1306401144547" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0211_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000003_0" START_TIME="1306400167882" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0211_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400169041" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0211_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306401147552" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0211" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0211_m_000000" TASK_TYPE="MAP" START_TIME="1306401147553" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0211_m_000001" TASK_TYPE="MAP" START_TIME="1306401148706" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0211_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000000_0" START_TIME="1306400170578" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0211_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400173406" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5051899)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(270068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(18000)][(SPILLED_RECORDS)(Spilled Records)(18000)][(MAP_OUTPUT_BYTES)(Map output bytes)(234000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(18000)]}" .
Task TASKID="task_201105251513_0211_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306401150556" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5051899)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(270068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(18000)][(SPILLED_RECORDS)(Spilled Records)(18000)][(MAP_OUTPUT_BYTES)(Map output bytes)(234000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(18000)]}" .
Task TASKID="task_201105251513_0211_r_000000" TASK_TYPE="REDUCE" START_TIME="1306401150557" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0211_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000001_0" START_TIME="1306400643825" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0211_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400645543" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(37233)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4540)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(300)][(SPILLED_RECORDS)(Spilled Records)(300)][(MAP_OUTPUT_BYTES)(Map output bytes)(3872)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(300)]}" .
Task TASKID="task_201105251513_0211_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306401151710" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(37233)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4540)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(300)][(SPILLED_RECORDS)(Spilled Records)(300)][(MAP_OUTPUT_BYTES)(Map output bytes)(3872)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(300)]}" .
Task TASKID="task_201105251513_0211_r_000001" TASK_TYPE="REDUCE" START_TIME="1306401151711" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0211_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0211_r_000000_0" START_TIME="1306400173563" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0211_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0211_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306400180836" SORT_FINISHED="1306400181124" FINISH_TIME="1306400182664" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(137978)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(137978)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2076)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(9001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(137984)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(193)][(SPILLED_RECORDS)(Spilled Records)(9200)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(9200)]}" .
Task TASKID="task_201105251513_0211_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306401162594" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(137978)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(137978)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2076)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(9001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(137984)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(193)][(SPILLED_RECORDS)(Spilled Records)(9200)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(9200)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0211_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0211_r_000001_0" START_TIME="1306400646490" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0211_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0211_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306400653730" SORT_FINISHED="1306400653948" FINISH_TIME="1306400656472" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(136506)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(136506)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1090)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(9000)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(135006)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(100)][(SPILLED_RECORDS)(Spilled Records)(9100)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(9100)]}" .
Task TASKID="task_201105251513_0211_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306401163728" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(136506)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(136506)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1090)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(9000)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(135006)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(100)][(SPILLED_RECORDS)(Spilled Records)(9100)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(9100)]}" .
Task TASKID="task_201105251513_0211_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306401163729" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0211_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000002_0" START_TIME="1306400658542" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0211_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0211_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400659733" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0211_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306401166732" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0211" FINISH_TIME="1306401166732" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(274484)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5089132)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(549092)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3166)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(18001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(18300)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(272990)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(293)][(SPILLED_RECORDS)(Spilled Records)(36600)][(MAP_OUTPUT_BYTES)(Map output bytes)(237872)][(MAP_OUTPUT_RECORDS)(Map output records)(18300)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(18300)]}" .