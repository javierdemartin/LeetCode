/// https://leetcode.com/problems/merge-two-sorted-lists/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Iterative approach.
 
 Time complexity: O(N + M)
 Space complexity: O(1). Only allocates a few pointers so it's contant in memory footprint.
 */

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1, l2 = l2
        
        /// New list that will hold the values that I want to return, this will
        /// point to the head of the list
        var newHead: ListNode? = ListNode(0)
        /// Pointer to traverse the solution's list and it will be advanced
        /// as new values are merged to the list
        var newTail = newHead
        
        /// Iterate until both of the values are `nil`
        while l1 != nil && l2 != nil {
            
            /// Append a value of `l1` if its head is lower than `l2` head value
            /// Advance `l1` as the current head has been merged into the solution
            if l1!.val <= l2!.val {
                newTail?.next = l1
                l1 = l1?.next
            } else if l1!.val > l2!.val {
                newTail?.next = l2
                l2 = l2?.next
            }
            
            /// Advance the tail pointer of the solution as a new value has been
            /// merged into the list
            newTail = newTail?.next
        }
        
        /// The while loop will break once eihter of the lists has reached the end
        /// The possible remaining values will be added to the tail of the list as they
        /// are going to be greater than the ones already on the list
        newTail?.next = l1 ?? l2
        
        return newHead?.next
    }
}

var l1 = ListNode(1, ListNode(2, ListNode(4)))
var l2 = ListNode(1, ListNode(3, ListNode(4)))

Solution().mergeTwoLists(l1, l2)

