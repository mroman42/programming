// Find the running median
// https://www.hackerrank.com/challenges/find-the-running-median/problem

#include<iostream>
#include<iomanip>
#include<vector>

using namespace std;

bool lesst(int a,int b) {return a < b;}
bool moret(int a,int b) {return a > b;}


void insert(vector<int>& max_heap, bool (*compare)(int,int), int a) {
  max_heap.push_back(a);
  int pointer = max_heap.size()-1;
  int parent = (pointer-1)/2;

  while (pointer != 0 and compare(max_heap[parent],max_heap[pointer])) {
    int swap = max_heap[pointer];
    max_heap[pointer] = max_heap[parent];
    max_heap[parent] = swap;

    pointer = parent;
    parent = (pointer-1)/2;
  }
}


// compare < max_heap -> lesser
// compare > min_heap -> greater
int pop(vector<int>& max_heap, bool (*compare)(int,int)) {
  int result = max_heap[0];
  max_heap[0] = max_heap[max_heap.size()-1];
  max_heap.resize(max_heap.size()-1);
  unsigned pointer = 0;
  bool change_left =
    ((pointer*2+1) < max_heap.size()) and compare(max_heap[pointer], max_heap[pointer*2+1]);
  bool change_right =
    ((pointer*2+2) < max_heap.size()) and compare(max_heap[pointer], max_heap[pointer*2+2]);

  while (change_left or change_right) {
    if (change_left and change_right) {
      if (compare(max_heap[pointer*2+1],max_heap[pointer*2+2]))
        change_left = false;
      else
        change_right = false;
    }
    if (change_left) {
      int swap = max_heap[pointer];
      max_heap[pointer] = max_heap[pointer*2+1];
      max_heap[pointer*2+1] = swap;
      pointer = pointer*2+1;
    }
    else if (change_right) {
      int swap = max_heap[pointer];
      max_heap[pointer] = max_heap[pointer*2+2];
      max_heap[pointer*2+2] = swap;
      pointer = pointer*2+2;
    }

    change_left =
      ((pointer*2+1) < max_heap.size()) and compare(max_heap[pointer], max_heap[pointer*2+1]);
    change_right =
      ((pointer*2+2) < max_heap.size()) and compare(max_heap[pointer], max_heap[pointer*2+2]);
  }

  return result;
}

int main() {
  cout << fixed << setprecision(1);
  int n; cin >> n;
  vector<int> max_heap;
  vector<int> min_heap;
  float median = 0;
  int diff = 0;
  int read;

  // First element
  cin >> read;
  max_heap.push_back(read);
  median = read;
  diff = 1;
  cout << float(median) << endl;

  // All elements
  for (int i=0; i<n-1; i++) {
    // Inserts new element
    cin >> read;

    if (read >= median) {
      insert(min_heap,moret,read);
      if (min_heap.size() > max_heap.size())
        insert(max_heap,lesst,pop(min_heap,moret));
    }

    if (read < median) {
      insert(max_heap,lesst,read);
      if (max_heap.size() > min_heap.size()+1)
        insert(min_heap,moret,pop(max_heap,lesst));
    }
    // Recomputes median
    if (i%2 == 0)
      median = (max_heap[0] + min_heap[0])/2.0;
    else
      median = (max_heap[0]);
    cout << float(median) << endl;

    // cerr << "max: [";
    // for (unsigned i=0; i<max_heap.size();i++)
    //   cerr <<max_heap[i] << ",";
    // cerr << "]\n";
    // cerr << "min: [";
    // for (unsigned i=0; i<min_heap.size();i++)
    //   cerr <<min_heap[i] << ",";
    // cerr << "]\n";
  }
}
