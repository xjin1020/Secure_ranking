//
//  order_preserving_encoder
//  SecureSearch_random_pertubation
//
//  Created by Xin Jin on 1/24/17.
//  Copyright (c) 2017 Xin Jin. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>

using namespace std;

struct FeatureEntry {
    string relevance;
    string qid;
    vector<double> features;
};

class OrderPreservingEncoder {
private:
    static const int featureNumber = 42;
    string inputName, outputName;
    vector<FeatureEntry> entries;
    vector<vector<double> > cols;
public:
    void readFeature() {
        ifstream fin;
        fin.open(inputName);
        string line;
        while (getline(fin, line)) {
            FeatureEntry entry;
            stringstream ss(line);
            string token;
            int i=0;
            while (getline(ss, token, ' ')) {
                i++;
                if (i == 2 + featureNumber) // just read relevance, qid and features
                    break;
                if (i == 1)
                    entry.relevance = token;
                else if (i == 2)
                    entry.qid = token;
                else {
                    double d = stod(token.substr(token.find(':') + 1));
                    entry.features.push_back(d);
                }
            }
            entries.push_back(entry);
        }
        cout << "Read " << entries.size() << " entries in total." << endl;
        fin.close();
    }
    void sortAndPerturb() {
        cols.resize(featureNumber, vector<double>(entries.size(), 0)); // feature in columns
        // sort
        for (int i=0; i<featureNumber; i++) {
            for (int j=0; j<entries.size(); j++)
                cols[i][j] = entries[j].features[i];
            sort(cols[i].begin(), cols[i].end());
            cols[i].push_back(1.333 * (*cols[i].rbegin())); // Push back a pesudo number which is 1/3 larger than the largest value so that the largest value can be handled the same as others.
        }
        // perturb
        for (int i=0; i<entries.size(); i++) {
            for (int j=0; j<featureNumber; j++) {
                vector<double>::iterator up = upper_bound(cols[j].begin(), cols[j].end(), entries[i].features[j]);
                double nextValue = *up;
                entries[i].features[j] = entries[i].features[j] + (nextValue - entries[i].features[j]) * 0.5; // r = [0, 1]
            }
        }
        cout << "Finish sorting and perturbing." << endl;
    }
    void writeFeature() {
        ofstream fout;
        fout.open(outputName);
        for (int i=0; i<entries.size(); i++) {
            fout << entries[i].relevance << " " << entries[i].qid;
            for (int j=0; j<featureNumber; j++)
                fout << " " << j << ":" << entries[i].features[j];
            fout << endl;
        }
        fout.close();
        cout << "Write " << entries.size() << " entries in total." << endl;
    }
    void work(string inputFileName) {
        inputName = inputFileName;
        outputName = inputName + ".ope";
        readFeature();
        sortAndPerturb();
        writeFeature();
    }
};

int main(int argc, const char * argv[])
{
    OrderPreservingEncoder ope;
    if (argc != 2)
        cout << "Need 1 parameter for the input feature file." << endl;
    else
        ope.work(argv[1]);
    return 0;
}

