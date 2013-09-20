Meta VERSION="1" .
Job JOBID="job_201105251513_0077" JOBNAME="PigLatin:22H55M55S069479048\.5X\.query\.11\.time_dim\.store_returns\.1\.2\.pig" USER="hadoop" SUBMIT_TIME="1306353232605" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0077/job\.xml" .
Job JOBID="job_201105251513_0077" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0077" LAUNCH_TIME="1306353232749" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0077_m_000003" TASK_TYPE="SETUP" START_TIME="1306353233129" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0077_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000003_0" START_TIME="1306352252196" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0077_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352253293" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0077_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353236133" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0077" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0077_m_000000" TASK_TYPE="MAP" START_TIME="1306353236134" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0077_m_000001" TASK_TYPE="MAP" START_TIME="1306353237732" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0077_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000001_0" START_TIME="1306352728670" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0077_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352732201" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5107780)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1296068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(86400)][(SPILLED_RECORDS)(Spilled Records)(86400)][(MAP_OUTPUT_BYTES)(Map output bytes)(1123200)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(86400)]}" .
Task TASKID="task_201105251513_0077_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353243757" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(5107780)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1296068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(86400)][(SPILLED_RECORDS)(Spilled Records)(86400)][(MAP_OUTPUT_BYTES)(Map output bytes)(1123200)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(86400)]}" .
Task TASKID="task_201105251513_0077_r_000000" TASK_TYPE="REDUCE" START_TIME="1306353243758" SPLITS="" .
Task TASKID="task_201105251513_0077_r_000001" TASK_TYPE="REDUCE" START_TIME="1306353244245" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0077_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000000_0" START_TIME="1306352254866" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0077_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306352261059" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272994)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697898)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
Task TASKID="task_201105251513_0077_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353245160" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(32710005)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(4272994)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(287514)][(SPILLED_RECORDS)(Spilled Records)(287514)][(MAP_OUTPUT_BYTES)(Map output bytes)(3697898)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(287514)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0077_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0077_r_000000_0" START_TIME="1306352734402" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0077_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0077_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306352741644" SORT_FINISHED="1306352742136" FINISH_TIME="1306352746976" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2842682)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2842682)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1668216)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(43201)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(648006)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139018)][(SPILLED_RECORDS)(Spilled Records)(192164)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(192164)]}" .
Task TASKID="task_201105251513_0077_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306353258770" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2842682)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2842682)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1668216)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(43201)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(648006)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(139018)][(SPILLED_RECORDS)(Spilled Records)(192164)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(192164)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0077_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0077_r_000001_0" START_TIME="1306353244601" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0077_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0077_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306353251741" SORT_FINISHED="1306353252279" FINISH_TIME="1306353257025" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2726256)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2726256)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1662600)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(43200)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(648006)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138550)][(SPILLED_RECORDS)(Spilled Records)(181750)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(181750)]}" .
Task TASKID="task_201105251513_0077_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306353259256" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2726256)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2726256)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1662600)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(43200)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(648006)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(138550)][(SPILLED_RECORDS)(Spilled Records)(181750)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(181750)]}" .
Task TASKID="task_201105251513_0077_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306353259257" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0077_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000002_0" START_TIME="1306353259286" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0077_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0077_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306353260399" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0077_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306353262261" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0077" FINISH_TIME="1306353262261" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(5568938)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(37817785)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(11138000)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3330816)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(86401)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(373914)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(1296012)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(277568)][(SPILLED_RECORDS)(Spilled Records)(747828)][(MAP_OUTPUT_BYTES)(Map output bytes)(4821098)][(MAP_OUTPUT_RECORDS)(Map output records)(373914)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(373914)]}" .
