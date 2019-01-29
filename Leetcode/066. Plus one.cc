class Solution {
public:
  vector<int> plusOne(vector<int>& digits) {
    int position = digits.size()-1;
    digits[position]++;

    while (digits[position] > 9 and position > 0) {
      digits[position] %= 10;
      position--;
      digits[position]++;
    }

    if (digits[position] > 9) {
      digits[position] %= 10;
      digits.insert(digits.begin(), 1);
    }

    return digits;
  }
};
