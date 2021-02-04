/// https://leetcode.com/problems/odd-even-linked-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Time complexity: O(N) as we need to go over all the N nodes of the input list
 Space: O(1), only using 4 pointers, O(4) which is O(1)
 */
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        var oddList: ListNode? = ListNode(0)
        var oddListHead: ListNode? = oddList
        var evenList: ListNode? = ListNode(0)
        var evenListHead: ListNode? = evenList
        
        if head == nil { return nil }
        
        /// First item is considered odd
        var counter = 1
        
        var head = head
        
        while head != nil {
            
            let val = head!.val
            
            if counter % 2 == 0 {
                evenListHead?.next = ListNode(val)
                evenListHead = evenListHead?.next
                
            } else {
                oddListHead?.next = ListNode(val)
                oddListHead = oddListHead?.next
            }
            
            head = head?.next
            counter += 1
        }
        
        // Skip the zeroes
        oddList = oddList?.next
        evenList = evenList?.next
        
        /// Move the head pointer adding to the tail the even list
        oddListHead?.next = evenList
        
        /// Return the head pointer of the list with the new items appended to the back
        return oddList
    }
}
/**
 
 */
