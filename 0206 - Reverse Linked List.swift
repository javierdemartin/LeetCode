// https://leetcode.com/problems/reverse-linked-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Time complexity: O(N) need to traverse the linked list until the end
 Space complexity: O(N) to keep track of the recursion stack
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {

        /// If `head == nil` no work to do, it's an empty linked list
        /// If `head.next == nil` we have on item, return the head.
        /// This marks the end of the downwards recursion. Base case as the single node is the reverse list
        /// One node is the reversed list as the next value is nil
        if head == nil  || head?.next == nil {
            return head
        }

        /// Reverse the ret of the list not including me, paass the next node
        /// This will not have a value until we get to tbe bottom of the list, last node
        let reverseListHead = reverseList(head?.next)

        /// Set the new head node's next node to be the previous head node which is now the end node
        /// Set my next node's next to me
        head?.next?.next = head

        /// Set the old head node's next to `nil`, making it the end node for now
        head?.next = nil

        /// Return upwards the end of the list's head by the end
        /// end recursion updwards adding each node itself to the reversed list while at the same time
        /// passing the list's head up and up the chain
        return reverseListHead
    }
}

var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))

Solution().reverseList(head)


