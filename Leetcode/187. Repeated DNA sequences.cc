class Solution {
public:
  vector<string> findRepeatedDnaSequences(string s) {
    unordered_set<string> sequences;
    unordered_set<string> repeated;

    for (int i=9; i < s.size(); i++) {
      string sub = s.substr(i-9,10);
      if (sequences.find(sub) == sequences.end())
        sequences.insert(sub);
      else
        repeated.insert(sub);
    }

    vector<string> repeatedv(0,"");
    for (string st : repeated)
      repeatedv.push_back(st);
    return repeatedv;
  }
};
