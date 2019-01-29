class Solution {
public:
  ListNode* removeElements(ListNode* head, int val) {
    ListNode* current = head;
    ListNode* previous = nullptr;

    while(current != nullptr) {
      if (current->val == val) {
        if (previous != nullptr)
          previous->next = current->next;
        else
          head = head->next;
      }
      else
        previous = current;
      current = current->next;
    }

    return head;
  }
};
