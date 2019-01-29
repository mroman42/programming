// Recursive solution
class Solution {
public:
bool equalToMirror(TreeNode* a, TreeNode* b) {
  if (a == nullptr or b == nullptr)
    return (a == b);
  return a->val == b->val and equalToMirror(a->left, b->right) and equalToMirror(a->right,b->left);
}

bool isSymmetric(TreeNode* root) {
  if (root == nullptr)
    return true;
  return equalToMirror(root->left, root->right);
}
};


// Iterative solution: BFS
class Solution {
public:
  bool isSymmetric(TreeNode* root) {
    if (root == nullptr)
      return true;

    queue<TreeNode*> lhq;
    queue<TreeNode*> rhq;
    lhq.push(root->left);
    rhq.push(root->right);

    while (!lhq.empty() and !rhq.empty()) {
      TreeNode* fl = lhq.front();
      TreeNode* fr = rhq.front();
      lhq.pop();
      rhq.pop();

      if (fr == nullptr and fl == nullptr)
        continue;
      if (fl == nullptr or fr == nullptr)
        return false;
      if (fl->val != fr->val)
        return false;

      lhq.push(fl->left);
      rhq.push(fr->right);
      lhq.push(fl->right);
      rhq.push(fr->left);
    }


    return (lhq.empty() and rhq.empty());
  }
};


// Iterative solution: DFS
class Solution {
public:
  bool isSymmetric(TreeNode* root) {
    if (root == nullptr)
      return true;

    stack<TreeNode*> lhq;
    stack<TreeNode*> rhq;
    lhq.push(root->left);
    rhq.push(root->right);

    while (!lhq.empty() and !rhq.empty()) {
      TreeNode* fl = lhq.top();
      TreeNode* fr = rhq.top();
      lhq.pop();
      rhq.pop();

      if (fl == nullptr and fr != nullptr)
        return false;
      if (fr == nullptr and fl != nullptr)
        return false;
      if (fr == nullptr and fl == nullptr)
        continue;

      if (fl->val != fr->val)
        return false;

      lhq.push(fl->left);
      rhq.push(fr->right);
      lhq.push(fl->right);
      rhq.push(fr->left);
    }

    return (lhq.empty() and rhq.empty());
  }
};

