#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

using namespace std;

int main()
{
    ifstream fin;
    ofstream fout;
    fin.open("new15.txt");
    fout.open("401-450new15.txt");
    string s, t;
    getline(fin, s);
    while(s.length() > 0){
        int p = s.find("qid:");
        if (p == string::npos)
            continue;
        t = s.substr(p+4, 3);
        int num = atoi(t.c_str());
        if (num <= 450 && num >=401)
            fout << s << endl;
        getline(fin, s);
    }
    fin.close();
    fout.close();
    return 0;
}
