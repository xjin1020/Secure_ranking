#time java -jar ./RankLib-2.1-patched.jar -train $1 -ranker 3 -kcv 3 -kcvmd modelsAda/ -kcvmn ca -round $2 -metric2t MAP -metric2T MAP
#time java -jar ./RankLib-2.1-patched.jar -feature bm.feature -train $1 -ranker 3 -save adamodel -round $2 -metric2t MAP -metric2T MAP
time java -Xmx12000m -jar ./RankLib-2.1-patched.jar -train $1 -ranker 3 -kcv 3 -kcvmd modelsAda/ -kcvmn ca -round $2 -metric2t MAP -metric2T MAP
