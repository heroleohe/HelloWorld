[root@SUS-KVM2 ~]# cat delsavelogs
#!/usr/bin/bash
if [ $# -ne 1 ]; then
    echo "SR number is needed"
    exit 0;
fi

SR=$1
DIR_LIST=(/var/issues/$SR /home/pteam2/SR_logs/$SR)

for DIR in ${DIR_LIST[@]}; do
        echo "to delete downloaded logs of $SR in $DIR ..."
        if [ -d $DIR ]; then
                 `rm -rf $DIR/*`;
                 if [ $? -ne 0 ]; then
                     #echo "failed to delete all files in $DIR";
                     echo "FAILED";
                 #else
                 #    echo "SUCCEEDED";
                 fi
        #else
           #echo "$DIR does not exist!";
        fi
done


exit 0;
