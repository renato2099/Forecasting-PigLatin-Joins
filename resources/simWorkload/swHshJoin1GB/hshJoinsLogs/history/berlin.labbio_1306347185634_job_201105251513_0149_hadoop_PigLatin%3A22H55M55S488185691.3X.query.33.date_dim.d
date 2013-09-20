Meta VERSION="1" .
Job JOBID="job_201105251513_0149" JOBNAME="PigLatin:22H55M55S488185691\.3X\.query\.33\.date_dim\.date_dim\.2\.2\.pig" USER="hadoop" SUBMIT_TIME="1306384661296" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0149/job\.xml" .
Job JOBID="job_201105251513_0149" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0149" LAUNCH_TIME="1306384661744" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0149_m_000003" TASK_TYPE="SETUP" START_TIME="1306384661852" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0149_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000003_0" START_TIME="1306384662157" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0149_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000003_0" TASK_STATUS="FAILED" FINISH_TIME="1306384664855" HOSTNAME="berlin\.labbio" ERROR="Error: java\.lang\.ClassNotFoundException: org\.apache\.hadoop\.hdfs\.protocol\.LocatedBlocks
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
Task TASKID="task_201105251513_0149_r_000003" TASK_TYPE="SETUP" START_TIME="1306384664855" SPLITS="" .
ReduceAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0149_r_000003" TASK_ATTEMPT_ID="attempt_201105251513_0149_r_000003_0" START_TIME="1306384664887" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0149_r_000003" TASK_ATTEMPT_ID="attempt_201105251513_0149_r_000003_0" TASK_STATUS="FAILED" FINISH_TIME="1306384667858" HOSTNAME="berlin\.labbio" ERROR="Error: java\.lang\.ClassNotFoundException: org\.apache\.hadoop\.hdfs\.protocol\.LocatedBlocks
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
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0149_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000003_1" START_TIME="1306384161963" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0149_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000003_1" TASK_STATUS="SUCCESS" FINISH_TIME="1306384163145" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0149_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384671300" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0149" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0149_m_000000" TASK_TYPE="MAP" START_TIME="1306384671300" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
Task TASKID="task_201105251513_0149_m_000001" TASK_TYPE="MAP" START_TIME="1306384672016" SPLITS="/default-rack/berlin\.labbio,/default-rack/moscou\.labbio,/default-rack/damasco\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0149_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000000_0" START_TIME="1306384164690" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0149_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306384168714" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0149_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384677305" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0149_r_000000" TASK_TYPE="REDUCE" START_TIME="1306384677306" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0149_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000001_0" START_TIME="1306383693867" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0149_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383697475" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0149_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384678021" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(10317438)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045440)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(73049)][(SPILLED_RECORDS)(Spilled Records)(73049)][(MAP_OUTPUT_BYTES)(Map output bytes)(1899274)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(73049)]}" .
Task TASKID="task_201105251513_0149_r_000001" TASK_TYPE="REDUCE" START_TIME="1306384678022" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0149_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0149_r_000000_0" START_TIME="1306384170664" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0149_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0149_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306384177788" SORT_FINISHED="1306384178140" FINISH_TIME="1306384182751" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045406)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045406)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241850)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36525)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2045412)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36525)][(SPILLED_RECORDS)(Spilled Records)(73050)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73050)]}" .
Task TASKID="task_201105251513_0149_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306384692320" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045406)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045406)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241850)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36525)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2045412)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36525)][(SPILLED_RECORDS)(Spilled Records)(73050)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73050)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0149_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0149_r_000001_0" START_TIME="1306383699554" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0149_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0149_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306383706746" SORT_FINISHED="1306383707174" FINISH_TIME="1306383711742" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045350)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045350)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241816)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(1022678)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36524)][(SPILLED_RECORDS)(Spilled Records)(73048)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73048)]}" .
Task TASKID="task_201105251513_0149_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306384693039" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2045350)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2045350)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1241816)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(36524)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(1022678)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(36524)][(SPILLED_RECORDS)(Spilled Records)(73048)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(73048)]}" .
Task TASKID="task_201105251513_0149_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306384693039" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0149_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000002_0" START_TIME="1306383714589" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0149_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0149_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383715835" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0149_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384696042" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0149" FINISH_TIME="1306384696043" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(4090756)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(20634876)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(8181636)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(2483666)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(73049)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(146098)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(3068090)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(73049)][(SPILLED_RECORDS)(Spilled Records)(292196)][(MAP_OUTPUT_BYTES)(Map output bytes)(3798548)][(MAP_OUTPUT_RECORDS)(Map output records)(146098)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(146098)]}" .
