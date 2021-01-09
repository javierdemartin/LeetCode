// https://leetcode.com/problems/delete-node-in-a-linked-list/

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
    /**
     We don't have access to the previous value so we can't modify the next value of that element.
     Solution is to update the current pointer to match the next one, this causes it to be deleted.
     
     Time-complexity: O(1)
     Space-complexity: O(1)
     */
    func deleteNode(_ node: ListNode?) {
        
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
}

let tree = ListNode(4, ListNode(5, ListNode(1, ListNode(9))))

let s = Solution()
let returned = s.deleteNode(tree.next)

dump(returned)

