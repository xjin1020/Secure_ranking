#!/bin/bash

# L=infinity 
filename=./08enterprise_assume_zero.txt.shuffled2
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_1_$i
done
./ep_google_doc_1.py &> ep_output1_shuffled2

# L=2, distance=3
filename=./08enterprise_assume_zero_3.txt.shuffled2
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_2_$i
done
./ep_google_doc_2.py &> ep_output2_shuffled2

# L=5, distance=6
filename=./08enterprise_assume_zero_6.txt.shuffled2
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_3_$i
done
./ep_google_doc_3.py &> ep_output3_shuffled2

# L=0, no distance feature
filename=./08enterprise_assume_zero.txt.shuffled2
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -feature non_dist.feature -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > ep_temp_4_$i
done
./ep_google_doc_4.py &> ep_output4_shuffled2
