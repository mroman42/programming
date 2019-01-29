class Solution {
public:
  bool isIsomorphic(string s, string t) {
    if (s.size() != t.size())
      return false;

    unordered_map<char,char> fts;
    unordered_map<char,char> stf;

    for (int i=0; i<t.size(); i++) {
      if (fts.find(s[i]) == fts.end())
        fts[s[i]] = t[i];
      else if (fts[s[i]] != t[i])
        return false;

      if (stf.find(t[i]) == stf.end())
        stf[t[i]] = s[i];
      else if (stf[t[i]] != s[i])
        return false;
    }

    return true;
  }
};
