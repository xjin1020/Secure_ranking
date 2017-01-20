#time java -jar RankLib.jar -save gbrtmodel_20k_1000_0.1_401-450 -shrinkage 0.1 -train ./401-450.txt -validate ./401-450.txt -ranker 0 -tree 20000 -estop 1000 -metric2t MAP -metric2T MAP
#time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -feature non_dist.feature -shrinkage 0.1 -train $1 -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $2 -leaf 10 -metric2t MAP -metric2T MAP
time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $1 -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $2 -leaf 10 -metric2t MAP -metric2T MAP
#time java -jar ./RankLib-2.1-patched.jar -feature bm.feature -shrinkage 0.1 -leaf 2 -train $1 -ranker 0 -kcv 3 -kcvmd models/ -kcvmn ca -tree $2 -metric2t MAP -metric2T MAP
