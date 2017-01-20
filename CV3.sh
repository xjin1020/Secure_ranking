#!/bin/bash
filename=./401-450new15.txt
for i in 50 
do
  ./GBRT3.sh $filename $i > temp3$i
done
