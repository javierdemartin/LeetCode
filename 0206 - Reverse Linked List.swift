// https://leetcode.com/problems/reverse-linked-list/

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var next: ListNode?
        var current = head
        var previous: ListNode?
        
        while current != nil {
            // Point to the next iteration
            next = current?.next
            // Switch the order of the pointer
            current?.next = previous
            previous = current // Advance, save for next iteration
            
            current = next
        }
        
        return previous
    }
}


let s = Solution()

let linkedList = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

s.reverseList(linkedList)


