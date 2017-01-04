#!/bin/bash
java -cp ./RankLib-2.1-patched.jar ciir.umass.edu.features.FeatureManager -input $1 -output ./ -shuffle
mv $1.shuffled $1.shuffled1
java -cp ./RankLib-2.1-patched.jar ciir.umass.edu.features.FeatureManager -input $1 -output ./ -shuffle
mv $1.shuffled $1.shuffled2
