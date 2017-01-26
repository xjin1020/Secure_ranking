#!/usr/bin/python
import re
import sys
l = [10, 20, 50, 100]
trainAvg = ['']*len(l)
testAvg = ['']*len(l)
train = [['']*len(l) for i in range(4)]
test = [['']*len(l) for i in range(4)]

for i in range(len(l)):
  filename = 'ep_temp_2_'+str(l[i])
  fin = open(filename, 'r')
  lines = fin.readlines()
  fin.close()
  flag = 0
  for line in lines:
    line = line.rstrip('\n')
    if flag == 1: # below the line of 'Summary:'
      line = line.replace(' ','')
      line = line.replace('|','')
      tokens = re.split('\t',line)
      for j in range(1,4):
        if tokens[0] == 'Fold'+str(j):
          train[j][i] =  tokens[1]      
          test[j][i] = tokens[2]
        if tokens[0] == 'Avg.':
          trainAvg[i] = tokens[1]
          testAvg[i] = tokens[2]
          
    else:
      if line == 'Summary:':
        flag = 1
#output
for j in range(1,4):
  for i in range(len(l)):
    sys.stdout.write(train[j][i]+'\t'+test[j][i]+'\t\t')
  sys.stdout.write('\n')
for i in range(len(l)):
  sys.stdout.write(trainAvg[i]+'\t'+testAvg[i]+'\t\t')
sys.stdout.write('\n')
