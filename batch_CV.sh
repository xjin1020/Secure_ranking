#!/bin/bash

# L=infinity 
filename=./new15_no_nan.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t MAP -metric2T MAP > temp_1_$i
done
./google_doc_1.py &> output1

# L=2, distance=3
filename=./new16_no_nan.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t MAP -metric2T MAP > temp_2_$i
done
./google_doc_2.py &> output2

# L=5, distance=6
filename=./new17_no_nan.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t MAP -metric2T MAP > temp_3_$i
done
./google_doc_3.py &> output3

# L=0, no distance feature
filename=./new15_no_nan.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -feature non_dist.feature -shrinkage 0.1 -train $filename -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t MAP -metric2T MAP > temp_4_$i
done
./google_doc_4.py &> output4
mv temp_* tmp/