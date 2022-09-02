#!/bin/bash
predir=Orifice
dirsuffix=/pdecompose-xline/
prestr=Lsrc_xline_f
suffix=.txt
orificelist=(4 5 6)
freqlist=(200 500 1000 1500 2000 3000 4000)
for n in ${orificelist[*]}
do
    for f in ${freqlist[*]}
    do 
        file=${predir}${n}${dirsuffix}${prestr}${f}${suffix}
        echo "Dealing file:" ${file}
        sed -i '1,8d' ${file}
    done
done
echo "Delete done!"
