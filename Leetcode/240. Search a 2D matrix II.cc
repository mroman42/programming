class Solution {
public:
  bool searchMatrix(vector<vector<int>>& matrix, int target) {
    int m = matrix.size();
    int n = matrix[0].size();
    int size = n*m;
  
    int xp = m-1;
    int yp = 0;
  
    while (yp < n and xp >= 0) {
      if (matrix[xp][yp] < target)
        yp++;
      else if (matrix[xp][yp] > target)
        xp--;
      else
        return true;
    }  
  
    return false;
  }
};
