 FILELIST=$1
 QUERY_LOC=$2
 NEW_QUERY_LOC=$3
 # depends on the location where the work is being done at
while read -r xFile ; do
    echo ""
    echo "Copying $xFile..."
    RESULT=`cp ${QUERY_LOC}/$xFile ${NEW_QUERY_LOC}/.`
    if [ -n "$RESULT" ]
    then 
        fatal "ERROR COPYING FILE . . . $xFile"
    fi;
           
done < $FILELIST

