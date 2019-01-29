class Solution {
public:
  vector<int> getRow(int rowIndex) {
    int k = rowIndex;
    vector<int> row {1};

    for (int i=0; i<k; i++) {
      int prev = row[0];
      for (int j=1; j<row.size(); j++) {
        int newprev = row[j];
        row[j] = prev + row[j];
        prev = newprev;
      }
      row.push_back(1);
    }

    return row;
  }
};
