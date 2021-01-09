// https://leetcode.com/problems/remove-duplicates-from-sorted-list/

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
     Time complexity: O(n) as each node is checked exactly once.
     Space complexity: O(1), no additional space is used.
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var current = head
        
        while current != nil {
            
            // If the next element is repeated skip it.
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            }
            // Otherwise proceed as normal
            else {
                current = current?.next
            }
        }
        
        return head
    }
}

let tree = ListNode(1, ListNode(1, ListNode(2)))

let s = Solution()
let returned = s.deleteDuplicates(tree)

dump(returned)

