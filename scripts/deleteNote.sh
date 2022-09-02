#!/bin/bash
predir=Orifice
file1=Lsrc_a.txt
file2=Lsrc_b.txt
file3=Rsrc_a.txt
file4=Rsrc_b.txt
filelist=($file1 $file2 $file3 $file4)
orificelist=(1 4 5 6)
for n in ${orificelist[*]}
do
    for ifile in ${filelist[*]}
    do
        file=${predir}${n}/${ifile}
        echo "Dealing file is:" $file
        sed -i '/% /d' ${file}
    done
done
echo "Dealing is done!"
