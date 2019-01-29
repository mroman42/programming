  class Solution {
  public:
    int access(vector<vector<int>>& matrix, int x, int y) {
      if (x < matrix.size() and x >= 0 and y >= 0 and y < matrix[x].size())
        return matrix[x][y];
      else
        return 0;
    }

    int triangle(int left, int right, int up, int down) {
      return (min(min(left,right),up) + 1) * down;
    }
    
    int maximalSquare(vector<vector<char>>& matrix) {
      // Transforms the matrix into an int matrix
      vector<vector<int>> imatrix;
      for (int i=0; i<matrix.size(); i++) {
        vector<int> row;
        for (int j=0; j<matrix[0].size(); j++)
          row.push_back(matrix[i][j]-'0');
        imatrix.push_back(row);
      }
        
      // Finds square
      int max = 0;
      for (int i=0; i<imatrix.size(); i++) {
        for (int j=0; j<imatrix[0].size(); j++) {
          imatrix[i][j] = triangle(access(imatrix, i-1, j), access(imatrix, i, j-1), access(imatrix,i-1,j-1), access(imatrix, i, j));
          if (max < imatrix[i][j])
            max = imatrix[i][j];
        }
        cout << endl;
      }
        
      return max*max;
    }   
  };
