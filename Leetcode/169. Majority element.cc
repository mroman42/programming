class Solution {
public:
  int majorityElement(vector<int>& nums) {
    int counter = 0;
    int majority = 0;

    for (int n : nums)
      if (n == majority)
        counter++;
      else if (counter == 0) {
        majority = n;
        counter++;
      }
      else
        counter--;

    return majority;
  }
};
