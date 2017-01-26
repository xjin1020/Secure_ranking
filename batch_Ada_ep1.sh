#!/bin/bash

# L=infinity 
filename=./08enterprise_assume_zero.txt.shuffled2
for i in 10 20 50 100
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_1_$i
done
./ep_google_doc_1.py &> ep_output1_shuffled2

