#!/bin/sh
PWD=`pwd`
echo "Please run in 'source /data/dev/miniconda2/bin/activate' env"
FN=$PWD/linux_stats/range_$1_$2
#cd ~/dev/linux/
cd ../../../linux/
git config merge.renameLimit 100000
git config diff.renameLimit 100000
git log --all --numstat -M --since "$1" --until "$2" | ~/dev/cncf/gitdm/src/cncfdm.py -n -b ~/dev/cncf/gitdm/src/ -t -z -d -D -U -u -f "$1" -e "$2" -h $FN.html -o $FN.txt -x $FN.csv > $FN.out
# git log --all --numstat -M --since "$1" --until "$2" | ~/dev/cncf/gitdm/src/cncfdm.py -n -b ~/dev/cncf/gitdm/src/ -t -z -d -D -U -u -f "$1" -e "$2" -h $FN.html -o $FN.txt -x $FN.csv
git config --unset diff.renameLimit
git config --unset merge.renameLimit
cd $PWD

