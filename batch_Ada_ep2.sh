#!/bin/bash

# L=2, distance=3
filename=./08enterprise_assume_zero_3.txt.shuffled2
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_2_$i
done
./ep_google_doc_2.py &> ep_output2_shuffled2

