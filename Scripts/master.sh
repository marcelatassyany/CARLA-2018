#!/bin/bash

i=1
h=4 #Number of Nodes

#$1  input parameter (integer) representing the Input Data Size used. 
while [ $i -lt 4 ];

do


#Running WordCount and Collection of Execution Time
date>> $h"-slave"/hora/$1"GB"/$i"-hora-"$1"GB".txt;/usr/bin/time -po $h"-slave"/tempo/$1"GB"/$i"-tempo-"$1"GB".txt bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.2.jar wordcount /dado$1"GB".txt /out$i"-"$1"GB"; date >> $h"-slave"/hora/$1"GB"/$i"-hora-"$1"GB".txt



i=$((i+1))
done

#Increased Input Data Size
bin/hadoop dfs "-rm" /dado$1"GB".txt
bin/hadoop dfs "-rm" /out$i"-"$1"GB"/*
bin/hadoop dfs "-rmdir" /out$i"-"$1"GB"
y=$1
x=$((y+1))
if [ $x -ne 17 ]; then
cat dado$1"GB".txt >> dado$x"GB".txt
cat dado.txt >> dado$x"GB".txt
rm '-rf' dado$1"GB".txt 
bin/hadoop dfs -copyFromLocal dado$x"GB".txt /
ls -lh dado$x"GB".txt
fi
