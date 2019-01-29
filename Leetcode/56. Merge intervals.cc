bool compareIntervals(const Interval& a, const Interval& b) {
  return a.start < b.start;
}

class Solution {
public:
  vector<Interval> merge(vector<Interval>& intervals) {
    vector<Interval> solution;
    if (intervals.size() == 0)
      return solution;
    sort(intervals.begin(), intervals.end(), compareIntervals);

    int start = intervals[0].start;
    int end = intervals[0].end;
    for (Interval i : intervals) {
      if (i.start > end) {
        solution.push_back(Interval(start,end));
        start = i.start;
      }

      end = max(end,i.end);
    }

    solution.push_back(Interval(start,end));
    return solution;
  }
};
