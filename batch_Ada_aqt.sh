#!/bin/bash

# L=infinity 
filename=./aquant_20170103.txt.shuffled1
for i in 10 20 50 100 200 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > aqt_temp_1_$i
done
./aqt_google_doc_1.py &> aqt_output1_shuffled1

# L=2, distance=3
filename=./aquant_20170112_distance3.txt.shuffled1
for i in 10 20 50 100 200
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > aqt_temp_2_$i
done
./aqt_google_doc_2.py &> aqt_output2_shuffled1

# L=5, distance=6
filename=./aquant_20170112_distance6.txt.shuffled1
for i in 10 20 50 100 200
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > aqt_temp_3_$i
done
./aqt_google_doc_3.py &> aqt_output3_shuffled1

# L=0, no distance feature
filename=./aquant_20170103.txt.shuffled1
for i in 10 20 50 100 200
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -norm linear -feature non_dist.feature -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t NDCG@10 -metric2T NDCG@10 > aqt_temp_4_$i
done
./aqt_google_doc_4.py &> aqt_output4_shuffled1
