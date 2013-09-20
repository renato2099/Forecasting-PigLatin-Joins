Meta VERSION="1" .
Job JOBID="job_201105251513_0147" JOBNAME="PigLatin:22H55M55S474581504\.3X\.query\.33\.customer\.customer\.2\.2\.pig" USER="hadoop" SUBMIT_TIME="1306384550459" JOBCONF="hdfs://berlin\.labbio:54310/mnt/hadoop-tmp/dir/hadoop-hadoop/mapred/system/job_201105251513_0147/job\.xml" .
Job JOBID="job_201105251513_0147" JOB_PRIORITY="NORMAL" .
Job JOBID="job_201105251513_0147" LAUNCH_TIME="1306384550681" TOTAL_MAPS="2" TOTAL_REDUCES="2" JOB_STATUS="PREP" .
Task TASKID="task_201105251513_0147_m_000003" TASK_TYPE="SETUP" START_TIME="1306384550755" SPLITS="" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0147_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000003_0" START_TIME="1306384551073" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0147_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000003_0" TASK_STATUS="FAILED" FINISH_TIME="1306384553758" HOSTNAME="berlin\.labbio" ERROR="Error: java\.lang\.ClassNotFoundException: org\.apache\.hadoop\.hdfs\.protocol\.LocatedBlocks
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
Task TASKID="task_201105251513_0147_r_000003" TASK_TYPE="SETUP" START_TIME="1306384553758" SPLITS="" .
ReduceAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0147_r_000003" TASK_ATTEMPT_ID="attempt_201105251513_0147_r_000003_0" START_TIME="1306384553783" TRACKER_NAME="tracker_berlin\.labbio:localhost/127\.0\.0\.1:38958" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0147_r_000003" TASK_ATTEMPT_ID="attempt_201105251513_0147_r_000003_0" TASK_STATUS="FAILED" FINISH_TIME="1306384556762" HOSTNAME="berlin\.labbio" ERROR="Error: java\.lang\.ClassNotFoundException: org\.apache\.hadoop\.hdfs\.protocol\.LocatedBlocks
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
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0147_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000003_1" START_TIME="1306384050634" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="SETUP" TASKID="task_201105251513_0147_m_000003" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000003_1" TASK_STATUS="SUCCESS" FINISH_TIME="1306384051814" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="setup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0147_m_000003" TASK_TYPE="SETUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384559993" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0147" JOB_STATUS="RUNNING" .
Task TASKID="task_201105251513_0147_m_000000" TASK_TYPE="MAP" START_TIME="1306384559994" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
Task TASKID="task_201105251513_0147_m_000001" TASK_TYPE="MAP" START_TIME="1306384560730" SPLITS="/default-rack/berlin\.labbio,/default-rack/damasco\.labbio,/default-rack/moscou\.labbio" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0147_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000000_0" START_TIME="1306384053346" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0147_m_000000" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000000_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306384057290" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(13209372)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2800068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(100000)][(SPILLED_RECORDS)(Spilled Records)(100000)][(MAP_OUTPUT_BYTES)(Map output bytes)(2600000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(100000)]}" .
Task TASKID="task_201105251513_0147_m_000000" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384565999" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(13209372)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2800068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(100000)][(SPILLED_RECORDS)(Spilled Records)(100000)][(MAP_OUTPUT_BYTES)(Map output bytes)(2600000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(100000)]}" .
Task TASKID="task_201105251513_0147_r_000000" TASK_TYPE="REDUCE" START_TIME="1306384566000" SPLITS="" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0147_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000001_0" START_TIME="1306383582586" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="MAP" TASKID="task_201105251513_0147_m_000001" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000001_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383586672" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(13209372)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2800068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(100000)][(SPILLED_RECORDS)(Spilled Records)(100000)][(MAP_OUTPUT_BYTES)(Map output bytes)(2600000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(100000)]}" .
Task TASKID="task_201105251513_0147_m_000001" TASK_TYPE="MAP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384566736" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(HDFS_BYTES_READ)(HDFS_BYTES_READ)(13209372)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2800068)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(100000)][(SPILLED_RECORDS)(Spilled Records)(100000)][(MAP_OUTPUT_BYTES)(Map output bytes)(2600000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(MAP_OUTPUT_RECORDS)(Map output records)(100000)]}" .
Task TASKID="task_201105251513_0147_r_000001" TASK_TYPE="REDUCE" START_TIME="1306384566737" SPLITS="" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0147_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0147_r_000000_0" START_TIME="1306384059346" TRACKER_NAME="tracker_damasco\.labbio:localhost/127\.0\.0\.1:47023" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0147_r_000000" TASK_ATTEMPT_ID="attempt_201105251513_0147_r_000000_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306384066550" SORT_FINISHED="1306384066932" FINISH_TIME="1306384071705" HOSTNAME="/default-rack/damasco\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2800062)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2800062)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1700034)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(50001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2800068)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(50001)][(SPILLED_RECORDS)(Spilled Records)(100002)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(100002)]}" .
Task TASKID="task_201105251513_0147_r_000000" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306384581014" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2800062)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2800062)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1700034)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(50001)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2800068)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(50001)][(SPILLED_RECORDS)(Spilled Records)(100002)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(100002)]}" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0147_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0147_r_000001_0" START_TIME="1306383588255" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
ReduceAttempt TASK_TYPE="REDUCE" TASKID="task_201105251513_0147_r_000001" TASK_ATTEMPT_ID="attempt_201105251513_0147_r_000001_0" TASK_STATUS="SUCCESS" SHUFFLE_FINISHED="1306383595500" SORT_FINISHED="1306383595965" FINISH_TIME="1306383600720" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="reduce > reduce" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2799950)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2799950)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1699966)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(49999)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2799956)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(49999)][(SPILLED_RECORDS)(Spilled Records)(99998)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(99998)]}" .
Task TASKID="task_201105251513_0147_r_000001" TASK_TYPE="REDUCE" TASK_STATUS="SUCCESS" FINISH_TIME="1306384581747" COUNTERS="{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(2799950)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(2799950)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(1699966)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(49999)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(2799956)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(49999)][(SPILLED_RECORDS)(Spilled Records)(99998)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(99998)]}" .
Task TASKID="task_201105251513_0147_m_000002" TASK_TYPE="CLEANUP" START_TIME="1306384581748" SPLITS="" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0147_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000002_0" START_TIME="1306383603293" TRACKER_NAME="tracker_moscou\.labbio:localhost/127\.0\.0\.1:36922" HTTP_PORT="50060" .
MapAttempt TASK_TYPE="CLEANUP" TASKID="task_201105251513_0147_m_000002" TASK_ATTEMPT_ID="attempt_201105251513_0147_m_000002_0" TASK_STATUS="SUCCESS" FINISH_TIME="1306383604463" HOSTNAME="/default-rack/moscou\.labbio" STATE_STRING="cleanup" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Task TASKID="task_201105251513_0147_m_000002" TASK_TYPE="CLEANUP" TASK_STATUS="SUCCESS" FINISH_TIME="1306384584752" COUNTERS="{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(SPILLED_RECORDS)(Spilled Records)(0)]}" .
Job JOBID="job_201105251513_0147" FINISH_TIME="1306384584752" JOB_STATUS="SUCCESS" FINISHED_MAPS="2" FINISHED_REDUCES="2" FAILED_MAPS="0" FAILED_REDUCES="0" COUNTERS="{(org\.apache\.hadoop\.mapred\.JobInProgress$Counter)(Job Counters )[(TOTAL_LAUNCHED_REDUCES)(Launched reduce tasks)(2)][(TOTAL_LAUNCHED_MAPS)(Launched map tasks)(2)][(DATA_LOCAL_MAPS)(Data-local map tasks)(2)]}{(FileSystemCounters)(FileSystemCounters)[(FILE_BYTES_READ)(FILE_BYTES_READ)(5600012)][(HDFS_BYTES_READ)(HDFS_BYTES_READ)(26418744)][(FILE_BYTES_WRITTEN)(FILE_BYTES_WRITTEN)(11200148)][(HDFS_BYTES_WRITTEN)(HDFS_BYTES_WRITTEN)(3400000)]}{(org\.apache\.hadoop\.mapred\.Task$Counter)(Map-Reduce Framework)[(REDUCE_INPUT_GROUPS)(Reduce input groups)(100000)][(COMBINE_OUTPUT_RECORDS)(Combine output records)(0)][(MAP_INPUT_RECORDS)(Map input records)(200000)][(REDUCE_SHUFFLE_BYTES)(Reduce shuffle bytes)(5600024)][(REDUCE_OUTPUT_RECORDS)(Reduce output records)(100000)][(SPILLED_RECORDS)(Spilled Records)(400000)][(MAP_OUTPUT_BYTES)(Map output bytes)(5200000)][(MAP_OUTPUT_RECORDS)(Map output records)(200000)][(COMBINE_INPUT_RECORDS)(Combine input records)(0)][(REDUCE_INPUT_RECORDS)(Reduce input records)(200000)]}" .
