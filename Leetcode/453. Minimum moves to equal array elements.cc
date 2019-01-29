class Solution {
public:
  int minMoves(vector<int>& nums) {
    int minimum = nums[0];
    for (int elem : nums)
      if (elem < minimum)
        minimum = elem;

    int moves = 0;
    for (int elem : nums)
      moves += elem-minimum;
    return moves;
  }
};
