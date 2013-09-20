Meta VERSION="1" .
Job JOBID="job_201105251513_0112" JOBNAME="PigLatin:22H55M55S294859392\.3X\.query\.31\.web_site\.web_site\.2\.2\.pig" USER="hadoop" SUBMIT_TIME="1306369251990" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0112/job\.xml" .
Job JOBID="job_201105251513_0112" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0112" LAUNCH_TIME="1306369252269" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0112_m_000003" TASK_TYPE="SETUP" START_TIME="1306369252689" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0112_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000003_0" START_TIME="1306368273160" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0112_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306368274258" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0112_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369255693" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0112" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0112_m_000000" TASK_TYPE="MAP" START_TIME="1306369255693" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
Task TASKID="task_201105251513_0112_m_000001" TASK_TYPE="MAP" START_TIME="1306369257068" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0112_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000000_0" START_TIME="1306368275881" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0112_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306368277791" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0112_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369258706" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0112_r_000000" TASK_TYPE="REDUCE" START_TIME="1306369258707" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0112_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000001_0" START_TIME="1306369257362" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0112_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306369259258" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0112_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369260072" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0112_r_000001" TASK_TYPE="REDUCE" START_TIME="1306369260073" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0112_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0112_r_000000_0" START_TIME="1306368278842" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0112_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0112_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306368286047" SORT_FINISHED="1306368286129" FINISH_TIME="1306368288426" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(82)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(231)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
Task TASKID="task_201105251513_0112_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306369270715" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(82)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(231)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0112_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0112_r_000001_0" START_TIME="1306369260103" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0112_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0112_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306369267614" SORT_FINISHED="1306369267675" FINISH_TIME="1306369269940" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(80)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(231)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
Task TASKID="task_201105251513_0112_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306369272094" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(80)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(231)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
Task TASKID="task_201105251513_0112_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306369272095" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0112_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000002_0" START_TIME="1306369272149" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0112_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0112_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306369273317" HOSTNAME="/default-rack/berlin\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0112_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306369275098" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0112" FINISH_TIME="1306369275098" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(912)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(17542)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1948)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(162)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(30)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(60)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(462)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(30)][(SPILLED_RECORDS)(Spilled Records)(120)][(MAP_OUTPUT_BYTES)(Map output bytes)(780)][(MAP_OUTPUT_RECORDS)(Map output records)(60)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(60)]}" .
