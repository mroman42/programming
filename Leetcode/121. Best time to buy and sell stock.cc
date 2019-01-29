class Solution {
public:
  int maxProfit(vector<int>& prices) {
    if (prices.size() == 0)
      return 0;

    int max = prices[0];
    int min = prices[0];
    int profit = 0;

    for (int p : prices) {
      if (p<min) {
        min = p;
        max = p;
      }
      if (p>max) {
        max = p;
      }

      if (max-min > profit)
        profit = max-min;
    }

    return profit;
  }
};
