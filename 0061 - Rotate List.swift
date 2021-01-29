// https://leetcode.com/problems/rotate-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Given a sample list like,
 
 | 1 | - | 2 | - | 3 | - | 4 | - | 5 | - nil
 
 Transform it
 
 Find the tail node unitl head.next == nil
 While doing that find the length of the list.
 Why do we need to find the length? K might be any value and it can be greater than the length of the list, by doing this we can skipp unnecesary laps around the list moving nodes
 Tail node link it to the head
 
 Time complexity: O(N)
 Space complexity: O(1)
 */

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if k == 0 || head == nil { return head }
        
        /// Pointer to find the end of the list
        var tail = head
        /// Depth of the list
        var length = 0
        
        /// Find the tail of the list
        /// while also finding the length of it
        while tail?.next != nil {
            length += 1
            tail = tail?.next
        }
        
        /// Add the last node to the count
        length += 1
        
        /// With the `tail` pointer pointing to the end of the list point the next node to the `head`
        /// This will create a loop, making `tail` a circular.
        /// Currently, `tail` is pointing to the last node of `head`
        tail?.next = head

        /// Puntero que apunta al final de la lista, [5]
        var newTail = tail
        
        /// Calculate the number of laps to iterate
        let k = k % (length)
        
        var iterations = length - k
        
        /// Advance the number of steps to point the new tail
        while iterations > 0 {
            iterations -= 1
            newTail = newTail?.next
        }
        
        /// `newTail` is pointing to the new end of the solution
        /// By advancing  to the next node in the circular list we have the solution already to go but without
        /// breaking the circular list
        var newHead = newTail?.next
        
        /// This point is the end of the queue by setting it to nil it's pointing to the end of the previous list
        newTail?.next = nil
        
        return newHead
    }
}

var list = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

Solution().rotateRight(list, 2)

