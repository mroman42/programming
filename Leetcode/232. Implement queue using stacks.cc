class Queue {
private:
  stack<int> in;
  stack<int> out;
public:
  void refill() {
    while (!in.empty()) {
      out.push(in.top());
      in.pop();
    }
  }

  // Push element x to the back of queue.
  void push(int x) {
    in.push(x);
  }

  // Removes the element from in front of queue.
  void pop(void) {
    if (out.empty())
      refill();
    out.pop();
  }

  // Get the front element.
  int peek(void) {
    if (out.empty())
      refill();
    return out.top();
  }

  // Return whether the queue is empty.
  bool empty(void) {
    return (out.empty() and in.empty());
  }
};