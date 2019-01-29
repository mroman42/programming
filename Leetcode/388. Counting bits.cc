class Solution {
public:
  vector<int> countBits(int num) {
    vector<int> count(num+1,0);

    for (int i=1; i<num+1; i++)
      count[i] = count[i>>1] + (i&1);

    return count;
  }
};
