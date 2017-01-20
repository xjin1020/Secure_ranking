#!/bin/bash
#filename=./aquant_20170103.txt
#filename=./enterprise_20170103.txt
filename=./results.08enterprise.CE051-127_proc.txt
for i in 10 20 50 100 
do
  ./GBRT3.sh $filename $i > temp$i
done
