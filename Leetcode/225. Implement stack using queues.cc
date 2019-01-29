class Stack {
private:
  queue<int> in;

  void last_to_head() {
    for (int i=0; i<in.size()-1; i++) {
      in.push(in.front());
      in.pop();
    }
  }

public:
  // Push element x onto stack.
  void push(int x) {
    in.push(x);
  }

  // Removes the element on top of the stack.
  void pop() {
    last_to_head();
    in.pop();
  }

  // Get the top element.
  int top() {
    last_to_head();
    int t = in.front();
    in.push(in.front());
    in.pop();
    return t;
  }

  // Return whether the stack is empty.
  bool empty() {
    return in.empty();
  }
};
