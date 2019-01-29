  /**
   ,* Definition for singly-linked list.
   ,* struct ListNode {
   ,*     int val;
   ,*     ListNode *next;
   ,*     ListNode(int x) : val(x), next(NULL) {}
   ,* };
   ,*/
  class Solution {
  public:
    ListNode* reverseBetween(ListNode* head, int m, int n) {
      // Case m=n
      if (n == m)
        return head;

      // Case m=1
      if (m == 1) {
        ListNode* previous = nullptr;
        ListNode* current = head;

        for (int i=0; i<n-m+1; i++) {
          ListNode* following = current->next;
          current->next = previous;
          previous = current;
          current = following;
        }

        head->next = current;
        return previous;
      }

      // Case m>1
      ListNode* start = head;
      for (int i=0; i<m-2; i++)
        start = start->next;
      ListNode* posstart = start->next;

      ListNode* previous = nullptr;
      ListNode* current = posstart;
      for (int i=0; i<n-m+1; i++) {
        ListNode* following = current->next;
        current->next = previous;
        previous = current;
        current = following;
      }

      start->next = previous;
      posstart->next = current;

      return head;
    }
  };
