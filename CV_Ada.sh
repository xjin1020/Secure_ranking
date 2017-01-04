#!/bin/bash
#filename=./401-450new13.txt.shuffled1
filename=./401-450bmnew.txt
#for i in 10 20 50 100 200 
for i in 10 
do
  ./Ada.sh $filename $i > temp$i
done
