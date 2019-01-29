class Solution {
public:
  vector<int> majorityElement(vector<int>& nums) {
    int counter1 = 0;
    int counter2 = 0;
    int maj1 = 0;
    int maj2 = 0;

    // Looks for candidates
    for (int n : nums) {
      if (n == maj1)
        counter1++;
      else if (n == maj2)
        counter2++;
      else if (counter1 == 0) {
        maj1 = n;
        counter1++;
      }
      else if (counter2 == 0) {
        maj2 = n;
        counter2++;
      }
      else {
        counter1--;
        counter2--;
      }
    }

    // Checks the elements
    int checkcount1 = 0;
    int checkcount2 = 0;
    for (int n : nums) {
      if (n == maj1) checkcount1++;
      if (n == maj2) checkcount2++;
    }

    vector<int> solution;
    if (checkcount1 > nums.size()/3)
      solution.push_back(maj1);
    if (checkcount2 > nums.size()/3 and maj2 != maj1)
      solution.push_back(maj2);
    return solution;
  }
};
