// This is an exercise from a Google example interview.
// https://www.youtube.com/watch?v=XKu_SEDAykw

bool HasPairWithSum (vector<int>& numbers, int sum) {
  unordered_set<int> complements;

  for (int n : numbers) {
    if (complements.find(n) != complements.end())
      return true;
    complements.add(sum-n);
  }

  return false;
}

