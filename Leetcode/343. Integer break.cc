class Solution {
public:
  int integerBreak(int n) {
    if (n == 1) return 1;
    if (n == 2) return 1;
    if (n == 3) return 2;

    int product = 1;
    if (n%3 == 1) {
      n -= 4; 
      product *= 4;
    }
    if (n%3 == 2) {
      n -= 2;
      product *= 2;
    }

    while (n > 0) {
      n -= 3;
      product *= 3;
    }

    return product;
  }
};
