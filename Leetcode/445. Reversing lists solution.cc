  /**
   ,* Definition for singly-linked list.
   ,* struct ListNode {
   ,*     int val;
   ,*     ListNode* next;
   ,*     ListNode(int x) : val(x), next(NULL) {}
   ,* };
   ,*/
  class Solution {
  private:
      ListNode* reverse(ListNode* head) {
          ListNode* previous = nullptr;
          ListNode* current = head;

          while (current != nullptr) {
              ListNode* following = current->next;
              current->next = previous;
              previous = current;
              current = following;
          }

          return previous;
      }

      ListNode* skipzeroes(ListNode* sum) {
          while (sum != nullptr and sum->val==0)
              sum = sum->next;

          if (sum == nullptr)
              sum = new ListNode(0);

          return sum;
      }


  public:
      ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
          l1 = reverse(l1);
          l2 = reverse(l2);
          ListNode* sum = new ListNode(0);
          ListNode* current = sum;

          while (l1 != nullptr or l2 != nullptr) {
              int l1val = (l1 == nullptr? 0 : l1->val);
              int l2val = (l2 == nullptr? 0 : l2->val);
              current->val += l1val+l2val;

              current->next = new ListNode(current->val > 9? 1 : 0);
              current->val %= 10;
              current = current->next;
              l1 = (l1 == nullptr? nullptr : l1->next);
              l2 = (l2 == nullptr? nullptr : l2->next);
          }

          sum = reverse(sum);
          sum = skipzeroes(sum);

          return sum;
      }
  };
