
QUERY_5X_LST=$1
QUERY_3X_LST=$2
QUERY_1X_LST=$3

ORIG_QUERY_REPO='queryRepository'
NEW_QUERY_REPO='expandedQueryRepository'
# depends on the location where the work is being done at
       while read -r xFile ; do
			 echo "EXECUTING PIG FILE $xFile..."
				cp ${ORIG_QUERY_REPO}/$xFile ${NEW_QUERY_REPO}/$(date +%HH%MM%SS%N).5X.$xFile
       done < ${QUERY_5X_LST}

       while read -r xFile ; do
			 echo "EXECUTING PIG FILE $xFile..."
				cp ${ORIG_QUERY_REPO}/$xFile ${NEW_QUERY_REPO}/$(date +%HH%MM%SS%N).3X.$xFile
       done < ${QUERY_3X_LST}

       while read -r xFile ; do
			 echo "EXECUTING PIG FILE $xFile..."
				cp ${ORIG_QUERY_REPO}/$xFile ${NEW_QUERY_REPO}/$(date +%HH%MM%SS%N).1X.$xFile
       done < ${QUERY_1X_LST}
