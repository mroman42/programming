class Solution {
public:
  int findMin(vector<int>& nums) {
    if (nums.size() == 1)
      return nums[0];

    int pivot = nums[0];
    int i = 0;
    int j = nums.size()-1;

    if (nums[j] > pivot)
      return pivot;

    while (j > i+1) {
      int m = (i+j)/2;
      if (nums[m] > pivot)
        i = m;
      else
        j = m;
    }

    return nums[j];
  }
};
