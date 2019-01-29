class Solution {
private:
  unordered_map<int, UndirectedGraphNode*> cloned;
public:
  UndirectedGraphNode* cloneGraph(UndirectedGraphNode* node) {
    if (node == nullptr)
      return nullptr;

    int label = node->label;

    if (cloned.find(label) != cloned.end()) 
      return cloned[label];

    UndirectedGraphNode* newnode = new UndirectedGraphNode(label);
    cloned[label] = newnode;

    for (UndirectedGraphNode* neighbor : node->neighbors)
      newnode->neighbors.push_back(cloneGraph(neighbor));

    return newnode;

  }
};
