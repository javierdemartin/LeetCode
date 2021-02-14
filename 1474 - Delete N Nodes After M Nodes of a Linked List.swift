/// https://leetcode.com/problems/delete-n-nodes-after-m-nodes-of-a-linked-list/solution/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Time complexity: O(N) as we need to traverse the whole list
 Space complexity: O(1), memory does not increase as the input increases
 */
class Solution {
    func deleteNodes(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        var head = head
        /// Pointer that traverses the list
        var dummyHead = head
        /// Saves the last node in the last interval to save
        var lastHeadToSave: ListNode? = nil
        
        /// Iterate until the linked list ends
        while dummyHead != nil {
            
            var toDelete = n, toSkip = m
            
            /// Nodes to not delete
            while dummyHead != nil && toSkip != 0 {
                /// Keep updating until we reach the nodes to skip
                lastHeadToSave = dummyHead
                dummyHead = dummyHead?.next
                toSkip -= 1
            }
            
            /// Nodes to actually delete
            while dummyHead != nil && toDelete != 0 {
                dummyHead = dummyHead?.next
                toDelete -= 1
            }
            
            /// `dummyHead` is at the start of the next interval to keep
            /// and `lastHeadToSave` is at the last node which we want to save
            lastHeadToSave?.next = dummyHead
        }
        
        return head
    }
}
