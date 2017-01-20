#!/bin/bash

# L=infinity 
filename=./aquant_20170103.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t MAP -metric2T MAP > aqt_temp_1_$i
done
./aqt_google_doc_1.py &> aqt_output1

# L=2, distance=3
filename=./aquant_20170112_distance3.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t MAP -metric2T MAP > aqt_temp_2_$i
done
./aqt_google_doc_2.py &> aqt_output2

# L=5, distance=6
filename=./aquant_20170112_distance6.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t MAP -metric2T MAP > aqt_temp_3_$i
done
./aqt_google_doc_3.py &> aqt_output3

# L=0, no distance feature
filename=./aquant_20170103.txt
for i in 10 20 50 100 
do
  time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $filename -ranker 3 -kcv 3 -kcvmd models/ -kcvmn ca -round $i -metric2t MAP -metric2T MAP > aqt_temp_4_$i
done
./aqt_google_doc_4.py &> aqt_output4
mv aqt_temp_* tmp/
