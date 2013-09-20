Meta VERSION="1" .
Job JOBID="job_201105251513_0198" JOBNAME="PigLatin:22H55M55S749837897\.1X\.query\.5\.inventory\.warehouse\.3\.1\.pig" USER="hadoop" SUBMIT_TIME="1306400580737" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0198/job\.xml" .
Job JOBID="job_201105251513_0198" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0198" LAUNCH_TIME="1306400580964" TOTAL_MAPS="5" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0198_m_000006" TASK_TYPE="SETUP" START_TIME="1306400582300" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0198_m_000006" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000006_0" START_TIME="1306399605620" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0198_m_000006" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000006_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306399606775" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0198_m_000006" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400585304" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0198" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0198_m_000000" TASK_TYPE="MAP" START_TIME="1306400585305" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
Task TASKID="task_201105251513_0198_m_000001" TASK_TYPE="MAP" START_TIME="1306400585305" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0198_m_000002" TASK_TYPE="MAP" START_TIME="1306400586441" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
Task TASKID="task_201105251513_0198_m_000003" TASK_TYPE="MAP" START_TIME="1306400586442" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000003_0" START_TIME="1306400081555" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000003_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400101770" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(26334261)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(35093548)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(52299386)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1743309)][(SPILLED_RECORDS)(Spilled Records)(3486618)][(MAP_OUTPUT_BYTES)(Map output bytes)(22663017)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(1743309)]}" .
Task TASKID="task_201105251513_0198_m_000003" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400607466" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(26334261)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(35093548)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(52299386)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(1743309)][(SPILLED_RECORDS)(Spilled Records)(3486618)][(MAP_OUTPUT_BYTES)(Map output bytes)(22663017)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(1743309)]}" .
Task TASKID="task_201105251513_0198_m_000004" TASK_TYPE="MAP" START_TIME="1306400607467" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
Task TASKID="task_201105251513_0198_r_000000" TASK_TYPE="REDUCE" START_TIME="1306400607467" SPLITS="" .
Task TASKID="task_201105251513_0198_r_000001" TASK_TYPE="REDUCE" START_TIME="1306400609318" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000004" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000004_0" START_TIME="1306400102363" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000004" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000004_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400103462" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(585)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(143)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(5)][(SPILLED_RECORDS)(Spilled Records)(5)][(MAP_OUTPUT_BYTES)(Map output bytes)(65)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(5)]}" .
Task TASKID="task_201105251513_0198_m_000004" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400610472" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(585)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(143)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(5)][(SPILLED_RECORDS)(Spilled Records)(5)][(MAP_OUTPUT_BYTES)(Map output bytes)(65)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(5)]}" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000002_0" START_TIME="1306400081482" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306400113667" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(50467458)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(67239937)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(100017452)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(3333910)][(SPILLED_RECORDS)(Spilled Records)(6667820)][(MAP_OUTPUT_BYTES)(Map output bytes)(43340830)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(3333910)]}" .
Task TASKID="task_201105251513_0198_m_000002" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400619586" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(50467458)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(67239937)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(100017452)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(3333910)][(SPILLED_RECORDS)(Spilled Records)(6667820)][(MAP_OUTPUT_BYTES)(Map output bytes)(43340830)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(3333910)]}" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000000_0" START_TIME="1306399608292" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306399645275" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(50352753)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(67239936)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(100019432)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(3333976)][(SPILLED_RECORDS)(Spilled Records)(6667952)][(MAP_OUTPUT_BYTES)(Map output bytes)(43341688)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(3333976)]}" .
Task TASKID="task_201105251513_0198_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400624474" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(50352753)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(67239936)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(100019432)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(3333976)][(SPILLED_RECORDS)(Spilled Records)(6667952)][(MAP_OUTPUT_BYTES)(Map output bytes)(43341688)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(3333976)]}" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000001_0" START_TIME="1306399608422" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0198_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306399644674" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(50359173)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(67239937)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(100014302)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(3333805)][(SPILLED_RECORDS)(Spilled Records)(6667610)][(MAP_OUTPUT_BYTES)(Map output bytes)(43339465)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(3333805)]}" .
Task TASKID="task_201105251513_0198_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400624475" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(50359173)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(67239937)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(100014302)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(3333805)][(SPILLED_RECORDS)(Spilled Records)(6667610)][(MAP_OUTPUT_BYTES)(Map output bytes)(43339465)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(3333805)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0198_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0198_r_000000_0" START_TIME="1306400102309" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0198_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0198_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306400128505" SORT_FINISHED="1306400135127" FINISH_TIME="1306400157068" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(org\.apache\.pig\.PigCounters)(org\.apache\.pig\.PigCounters)[(PROACTIVE_SPILL_COUNT)(PROACTIVE_SPILL_COUNT)(3435818)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(70470036)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(70470036)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(18792000)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(2)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(50490054)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(4698000)][(SPILLED_RECORDS)(Spilled Records)(4698002)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(4698002)]}" .
Task TASKID="task_201105251513_0198_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306400664711" COUNTERS="{(org\.apache\.pig\.PigCounters)(org\.apache\.pig\.PigCounters)[(PROACTIVE_SPILL_COUNT)(PROACTIVE_SPILL_COUNT)(3435818)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(70470036)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(70470036)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(18792000)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(2)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(50490054)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(4698000)][(SPILLED_RECORDS)(Spilled Records)(4698002)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(4698002)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0198_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0198_r_000001_0" START_TIME="1306399632554" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0198_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0198_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306399656395" SORT_FINISHED="1306399666617" FINISH_TIME="1306399693051" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(org\.apache\.pig\.PigCounters)(org\.apache\.pig\.PigCounters)[(PROACTIVE_SPILL_COUNT)(PROACTIVE_SPILL_COUNT)(5299341)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(105705051)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(105705051)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(28188000)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(3)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(105705075)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(7047000)][(SPILLED_RECORDS)(Spilled Records)(7047003)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(7047003)]}" .
Task TASKID="task_201105251513_0198_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306400672723" COUNTERS="{(org\.apache\.pig\.PigCounters)(org\.apache\.pig\.PigCounters)[(PROACTIVE_SPILL_COUNT)(PROACTIVE_SPILL_COUNT)(5299341)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(105705051)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(105705051)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(28188000)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(3)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(105705075)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(7047000)][(SPILLED_RECORDS)(Spilled Records)(7047003)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(7047003)]}" .
Task TASKID="task_201105251513_0198_m_000005" TASK_TYPE="CLEANUP" START_TIME="1306400672723" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0198_m_000005" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000005_0" START_TIME="1306399695712" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0198_m_000005" TASK_ATTEMPT_ID="attempt_201105251513_0198_m_000005_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306399696940" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0198_m_000005" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306400675727" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0198" FINISH_TIME="1306400675727" JOB_STATUS="SUCCESS" FINISHED_MAPS="5" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(5)][(DATA_LOCAL_MAPS)(Data-local map tasks)(5)]}{(org\.apache\.pig\.PigCounters)(org\.apache\.pig\.PigCounters)[(PROACTIVE_SPILL_COUNT)(PROACTIVE_SPILL_COUNT)(8735159)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(353688732)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(236813943)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(528525802)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(46980000)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(5)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(11745005)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(156195129)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(11745000)][(SPILLED_RECORDS)(Spilled Records)(35235010)][(MAP_OUTPUT_BYTES)(Map output bytes)(152685065)][(MAP_OUTPUT_RECORDS)(Map output records)(11745005)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(11745005)]}" .