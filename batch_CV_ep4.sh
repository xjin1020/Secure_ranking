#!/bin/bash

# L=0, no distance feature
filename=./08enterprise_assume_zero.txt.shuffled2
for i in 10 20 50 100 200
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -feature non_dist.feature -shrinkage 0.1 -train $filename -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_4_$i
done
./ep_google_doc_4.py &> ep_output4_shuffled2
