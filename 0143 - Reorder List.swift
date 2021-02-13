/// https://leetcode.com/problems/reorder-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Combination of different problems which apply basic components to manage linked lists:
 
 1. Find the middle node of a linked list
 2. Reverse a linked list
 3. Merge two sorted lists
 
 If we're given a linked list like: 1 - 2 - 3 - 4 - 5
 
 1. Find the middle: 1 - 2 - 3      4 - 5
 2. Reverse the second middle list: 1 - 2 - 3   5 - 4
 3. Merge the two lists into one: 1 - 5 - 2 - 4 - 3
 
 */
class Solution {
    
    /**
     Time complexity: O(N)
     Space complexity: O(1)
     */
    func reorderList(_ head: ListNode?) {
        
        if head == nil || head?.next == nil { return }
        
        var head = head
        
        /// Divide the given list into two separate lists
        let middle = findMiddle(head)
        /// Reverse the second part of the list
        var reverseMiddle = reverse(middle)
        /// Assign the stiched lists to the head
        head = stitchTwoSortedLists(head, reverseMiddle)
    }
    
    /// https://leetcode.com/problems/middle-of-the-linked-list/
    func findMiddle(_ h: ListNode?) -> ListNode? {
        var slow = h, fast = h
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    /// https://leetcode.com/problems/reverse-linked-list/
    func reverse(_ t: ListNode?) -> ListNode? {
        
        if t == nil || t?.next == nil {
            return t
        }
        
        let reverseHead = reverse(t?.next)
        
        t?.next?.next = t
        t?.next = nil
        
        return reverseHead
    }
    
    /// https://leetcode.com/problems/merge-two-sorted-lists/
    func stitchTwoSortedLists(_ head: ListNode?, _ reverseMiddle: ListNode?) -> ListNode? {
        /// Create a local copy of both inputs to modify them
        var reverseMiddle = reverseMiddle
        var head = head
        
        /// Final stitched list which will contain the result
        var newHead: ListNode? = ListNode(0)
        
        var tail = newHead
        
        /// Index to decide which node to add next to the result
        var i = 0
        
        while reverseMiddle != nil && head != nil {
            
            if i % 2 != 0 {
                tail?.next = reverseMiddle
                reverseMiddle = reverseMiddle?.next
            } else {
                tail?.next = head
                head = head?.next
            }
            
            i += 1
            /// Advance a position to the end
            tail = tail?.next
        }
        
        return newHead?.next
    }
}
