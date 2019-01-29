class Solution {
public:
  void nextPermutation(vector<int>& arr) {
    if (arr.size() == 0)
      return;

    // Find maximum sequence
    int end = arr.size()-1;
    while (end != 0 and arr[end]<=arr[end-1])
      end--;

    // Reverse the array
    int left = end;
    int right = arr.size()-1;
    while (left < right) {
      int swap = arr[left];
      arr[left] = arr[right];
      arr[right] = swap;
      left++;
      right--;
    }

    // Include next element
    if (end != 0) {
      int moving = end;
      while(arr[end-1] >= arr[moving])
        moving++;

      int swap = arr[end-1];
      arr[end-1] = arr[moving];
      arr[moving] = swap;
    }
  }
};
