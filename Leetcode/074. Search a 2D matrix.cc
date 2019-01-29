class Solution {
public:
  bool searchMatrix(vector<vector<int>>& matrix, int target) {
    int m = matrix.size();
    int n = matrix[0].size();
    int size = n*m;

    int left = 0;
    int right = size;
    while (left < right) {
      int middle = (left+right)/2;
      int attempt = matrix[middle/n][middle%n];

      if (target < attempt)
        right = middle;
      else if (target > attempt)
        left = middle+1;
      else
        return true;
    }

    return false;
  }
};
