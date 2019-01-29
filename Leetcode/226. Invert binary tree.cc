class Solution {
public:
  TreeNode* invertTree(TreeNode* root) {
    if (root == nullptr) return root;

    TreeNode* swap = root->left;
    root->left = root->right;
    root->right = swap;

    root->left = invertTree(root->left);
    root->right = invertTree(root->right);

    return root;
  }
};
