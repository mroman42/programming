class Solution {
public:
  bool containsNearbyDuplicate(vector<int>& nums, int k) {
    unordered_set<int> nearby;

    for (int i=0; i<nums.size(); i++) {
      if (nearby.find(nums[i]) != nearby.end())
        return true;

      nearby.insert(nums[i]);

      if (i>=k)
        nearby.erase(nums[i-k]);
    }

    return false;
  }
};
