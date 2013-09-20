Meta VERSION="1" .
Job JOBID="job_201105251513_0145" JOBNAME="PigLatin:22H55M55S465940138\.3X\.query\.31\.web_site\.web_site\.2\.2\.pig" USER="hadoop" SUBMIT_TIME="1306384434299" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0145/job\.xml" .
Job JOBID="job_201105251513_0145" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0145" LAUNCH_TIME="1306384434525" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0145_m_000003" TASK_TYPE="SETUP" START_TIME="1306384436656" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0145_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000003_0" START_TIME="1306384437003" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0145_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000003_0" TASK_STATUS="FAILED" FINISH_TIME="1306384439659" HOSTNAME="berlin\.labbio" ERROR="Error: java\.lang\.ClassNotFoundException: org\.apache\.hadoop\.hdfs\.protocol\.LocatedBlocks
	at java\.net\.URLClassLoader$1\.run(URLClassLoader\.java:214)
	at java\.security\.AccessController\.doPrivileged(Native Method)
	at java\.net\.URLClassLoader\.findClass(URLClassLoader\.java:205)
	at java\.lang\.ClassLoader\.loadClass(ClassLoader\.java:321)
	at sun\.misc\.Launcher$AppClassLoader\.loadClass(Launcher\.java:294)
	at java\.lang\.ClassLoader\.loadClass(ClassLoader\.java:266)
	at java\.lang\.Class\.getDeclaredMethods0(Native Method)
	at java\.lang\.Class\.privateGetDeclaredMethods(Class\.java:2444)
	at java\.lang\.Class\.privateGetPublicMethods(Class\.java:2564)
	at java\.lang\.Class\.getMethods(Class\.java:1427)
	at sun\.misc\.ProxyGenerator\.generateClassFile(ProxyGenerator\.java:426)
	at sun\.misc\.ProxyGenerator\.generateProxyClass(ProxyGenerator\.java:323)
	at java\.lang\.reflect\.Proxy\.getProxyClass(Proxy\.java:518)
	at java\.lang\.reflect\.Proxy\.newProxyInstance(Proxy\.java:598)
	at org\.apache\.hadoop\.ipc\.RPC\.getProxy(RPC\.java:355)
	at org\.apache\.hadoop\.hdfs\.DFSClient\.createRPCNamenode(DFSClient\.java:106)
	at org\.apache\.hadoop\.hdfs\.DFSClient\.<init>(DFSClient\.java:207)
	at org\.apache\.hadoop\.hdfs\.DFSClient\.<init>(DFSClient\.java:170)
	at org\.apache\.hadoop\.hdfs\.DistributedFileSystem\.initialize(DistributedFileSystem\.java:82)
	at org\.apache\.hadoop\.fs\.FileSystem\.createFileSystem(FileSystem\.java:1378)
	at org\.apache\.hadoop\.fs\.FileSystem\.access$200(FileSystem\.java:66)
	at org\.apache\.hadoop\.fs\.FileSystem$Cache\.get(FileSystem\.java:1390)
	at org\.apache\.hadoop\.fs\.FileSystem\.get(FileSystem\.java:196)
	at org\.apache\.hadoop\.fs\.FileSystem\.get(FileSystem\.java:95)
	at org\.apache\.hadoop\.mapred\.Child\.main(Child\.java:168)
Caused by: java\.io\.EOFException: Detect premature EOF
	at sun\.misc\.Resource\.getBytes(Resource\.java:131)
	at java\.net\.URLClassLoader\.defineClass(URLClassLoader\.java:273)
	at java\.net\.URLClassLoader\.access$000(URLClassLoader\.java:73)
	at java\.net\.URLClassLoader$1\.run(URLClassLoader\.java:212)
	\.\.\. 24 more
" .
Task TASKID="task_201105251513_0145_r_000003" TASK_TYPE="SETUP" START_TIME="1306384439659" SPLITS="" .
ReduceAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0145_r_000003" TASK_ATTEMPT_ID="attempt_201105251513_0145_r_000003_0" START_TIME="1306384439695" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0145_r_000003" TASK_ATTEMPT_ID="attempt_201105251513_0145_r_000003_0" TASK_STATUS="FAILED" FINISH_TIME="1306384442663" HOSTNAME="berlin\.labbio" ERROR="Error: java\.lang\.ClassNotFoundException: org\.apache\.hadoop\.hdfs\.protocol\.LocatedBlocks
	at java\.net\.URLClassLoader$1\.run(URLClassLoader\.java:214)
	at java\.security\.AccessController\.doPrivileged(Native Method)
	at java\.net\.URLClassLoader\.findClass(URLClassLoader\.java:205)
	at java\.lang\.ClassLoader\.loadClass(ClassLoader\.java:321)
	at sun\.misc\.Launcher$AppClassLoader\.loadClass(Launcher\.java:294)
	at java\.lang\.ClassLoader\.loadClass(ClassLoader\.java:266)
	at java\.lang\.Class\.getDeclaredMethods0(Native Method)
	at java\.lang\.Class\.privateGetDeclaredMethods(Class\.java:2444)
	at java\.lang\.Class\.privateGetPublicMethods(Class\.java:2564)
	at java\.lang\.Class\.getMethods(Class\.java:1427)
	at sun\.misc\.ProxyGenerator\.generateClassFile(ProxyGenerator\.java:426)
	at sun\.misc\.ProxyGenerator\.generateProxyClass(ProxyGenerator\.java:323)
	at java\.lang\.reflect\.Proxy\.getProxyClass(Proxy\.java:518)
	at java\.lang\.reflect\.Proxy\.newProxyInstance(Proxy\.java:598)
	at org\.apache\.hadoop\.ipc\.RPC\.getProxy(RPC\.java:355)
	at org\.apache\.hadoop\.hdfs\.DFSClient\.createRPCNamenode(DFSClient\.java:106)
	at org\.apache\.hadoop\.hdfs\.DFSClient\.<init>(DFSClient\.java:207)
	at org\.apache\.hadoop\.hdfs\.DFSClient\.<init>(DFSClient\.java:170)
	at org\.apache\.hadoop\.hdfs\.DistributedFileSystem\.initialize(DistributedFileSystem\.java:82)
	at org\.apache\.hadoop\.fs\.FileSystem\.createFileSystem(FileSystem\.java:1378)
	at org\.apache\.hadoop\.fs\.FileSystem\.access$200(FileSystem\.java:66)
	at org\.apache\.hadoop\.fs\.FileSystem$Cache\.get(FileSystem\.java:1390)
	at org\.apache\.hadoop\.fs\.FileSystem\.get(FileSystem\.java:196)
	at org\.apache\.hadoop\.fs\.FileSystem\.get(FileSystem\.java:95)
	at org\.apache\.hadoop\.mapred\.Child\.main(Child\.java:168)
Caused by: java\.io\.EOFException: Detect premature EOF
	at sun\.misc\.Resource\.getBytes(Resource\.java:131)
	at java\.net\.URLClassLoader\.defineClass(URLClassLoader\.java:273)
	at java\.net\.URLClassLoader\.access$000(URLClassLoader\.java:73)
	at java\.net\.URLClassLoader$1\.run(URLClassLoader\.java:212)
	\.\.\. 24 more
" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0145_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000003_1" START_TIME="1306383936442" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0145_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000003_1" TASK_STATUS="SUCCESS" FINISH_TIME="1306383937563" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0145_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384445797" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0145" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0145_m_000000" TASK_TYPE="MAP" START_TIME="1306384445797" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
Task TASKID="task_201105251513_0145_m_000001" TASK_TYPE="MAP" START_TIME="1306384446389" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0145_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000000_0" START_TIME="1306383939153" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0145_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383940804" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0145_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384448801" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0145_r_000000" TASK_TYPE="REDUCE" START_TIME="1306384448802" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0145_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000001_0" START_TIME="1306383468218" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0145_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383469951" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0145_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384449392" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(8771)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(518)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(30)][(SPILLED_RECORDS)(Spilled Records)(30)][(MAP_OUTPUT_BYTES)(Map output bytes)(390)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(30)]}" .
Task TASKID="task_201105251513_0145_r_000001" TASK_TYPE="REDUCE" START_TIME="1306384449393" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0145_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0145_r_000000_0" START_TIME="1306383942147" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0145_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0145_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306383949322" SORT_FINISHED="1306383949365" FINISH_TIME="1306383951613" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(82)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(462)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
Task TASKID="task_201105251513_0145_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306384460810" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(82)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(462)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0145_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0145_r_000001_0" START_TIME="1306383470904" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0145_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0145_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306383478141" SORT_FINISHED="1306383478217" FINISH_TIME="1306383480504" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(80)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(462)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
Task TASKID="task_201105251513_0145_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306384461402" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(456)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(456)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(80)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(15)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(462)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(15)][(SPILLED_RECORDS)(Spilled Records)(30)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(30)]}" .
Task TASKID="task_201105251513_0145_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306384461403" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0145_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000002_0" START_TIME="1306383482908" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0145_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0145_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383484041" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0145_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384464405" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0145" FINISH_TIME="1306384464406" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(912)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(17542)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(1948)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(162)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(30)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(60)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(924)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(30)][(SPILLED_RECORDS)(Spilled Records)(120)][(MAP_OUTPUT_BYTES)(Map output bytes)(780)][(MAP_OUTPUT_RECORDS)(Map output records)(60)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(60)]}" .
