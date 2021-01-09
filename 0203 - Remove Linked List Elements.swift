// https://leetcode.com/problems/remove-linked-list-elements/

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


/**
 Remove the element from a singly linked list if node.next.value = actual.value.
 
 Can't think backwards as it's a singly linked list.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var initial = ListNode(0, head)
        
        var current = head
        var previous = initial
        
        while current != nil {
            
            if current?.val == val {
                previous.next = current?.next
            } else {
                previous = current!
            }
            
            current = current?.next
        }
        
        return initial.next
    }
}

//let tree = ListNode(1, ListNode(2, ListNode(6, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))
let tree = ListNode(6, ListNode(6))

let s = Solution()
let returned = s.removeElements(tree, 6)

dump(returned)

