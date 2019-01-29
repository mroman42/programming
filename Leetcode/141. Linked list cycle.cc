class Solution {
public:
  bool hasCycle(ListNode *head) {
    ListNode* slow = head;
    ListNode* fast = head;

    while (fast != nullptr and fast->next != nullptr and slow != nullptr) {
      fast = fast->next->next;
      slow = slow->next;
      if (fast == slow)
        return true;
    }

    return false;
  }
};
