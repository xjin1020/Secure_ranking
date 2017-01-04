#!/bin/bash
filename=./401-450new13.txt.shuffled2
for i in 10 20 50 100 200 
do
  ./GBRT3.sh $filename $i > temp2_$i
done
