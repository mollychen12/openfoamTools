#!/bin/bash
freqlist=(200 500 1000 2000 3000 4000)
for ifrq in ${freqlist[*]}
do
    file=f${ifrq}.txt
    echo 'file is:'$file
    line2=$(sed -n 2p $file)
    echo 'Line2 is:'$line2
    sed -i '$a\'"${line2}" $file
    sed -i '2d' $file
done
