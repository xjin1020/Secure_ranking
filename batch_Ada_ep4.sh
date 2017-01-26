#!/bin/bash

# L=0, no distance feature
filename=./08enterprise_assume_zero.txt.shuffled2
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -feature non_dist.feature -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_4_$i
done
./ep_google_doc_4.py &> ep_output4_shuffled2
