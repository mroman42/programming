class Solution {
public:
  int integerReplacement(int n) {
    if (n == 2147483647) return 32;

    int counter = 0;

    while (n > 3) {
      if (n & 1) {
        if (n & 2)
          n++;
        else
          n--;
      }
      else
        n >>= 1;
      counter++;
    }

    if (n==3) return 2+counter;
    if (n==2) return 1+counter;
    return counter;
  }
};
