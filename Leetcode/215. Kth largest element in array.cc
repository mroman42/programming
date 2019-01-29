class Solution {
public:
  int select(vector<int>& nums, const int k, const int left, const int right) {
    const int pivot = nums[left];
    int i = left+1;
    int j = right;

    while (i <= j) {
      while (nums[i] < pivot)
        i++;
      while (nums[j] >= pivot and j>left)
        j--;
      if (i < j) {
        int swap = nums[i];
        nums[i] = nums[j];
        nums[j] = swap;
      }
    }

    // changes pivot
    nums[left] = nums[j];
    nums[j] = pivot;

    if (k < j)
      return select(nums, k, left, j-1);
    else if (k > j)
      return select(nums, k, j+1, right);
    else
      return pivot;
  }

  int findKthLargest(vector<int>& nums, int k) {
    return select(nums, nums.size()-k, 0, nums.size()-1);
  }
};
