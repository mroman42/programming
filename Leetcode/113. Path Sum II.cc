  /**
   ,* Definition for a binary tree node.
   ,* struct TreeNode {
   ,*     int val;
   ,*     TreeNode *left;
   ,*     TreeNode *right;
   ,*     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
   ,* };
   ,*/
  class Solution {
  public:
    vector<vector<int>> pathSum(TreeNode* root, int sum) {
      vector<vector<int>> result;
      pathSumAcc(root,sum,result,vector<int>());
      return result;
    }

    void pathSumAcc(TreeNode* root, int sum, vector<vector<int>>& result, vector<int> acc) {
      if (root == nullptr) {
        if (sum == 0 and acc.size() != 0)
          result.push_back(acc);
        return;
      }

      if (root->left == nullptr and root->right == nullptr)
        if (sum == root->val) {
          acc.push_back(root->val);
          result.push_back(acc);
          return;
        }

      acc.push_back(root->val);
      if (root->right != nullptr) pathSumAcc(root->right, sum-root->val, result, acc);
      if (root->left != nullptr) pathSumAcc(root->left, sum-root->val, result, acc);
    }
  };
