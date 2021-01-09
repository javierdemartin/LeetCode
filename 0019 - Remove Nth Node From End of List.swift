// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        // "Backup"
        var dummy: ListNode? = ListNode(0, head)
        // Used in the first pass to know the depth of the Linked List
        var first = head
        var depth = 0
        
        // First pass to know the depth of the Linked List
        while first != nil {
            depth += 1;
            first = first?.next
        }
        
        print("Depth \(depth)")
        
        // Substract the Nth node we want to be deleted
        depth -= n
        
        // Set a pointer to the dummy node
        first = dummy
    
        // Move the pointer until it reaches L-n
        while depth > 0 {
            depth -= 1
            first = first?.next
        }
        
        // Skip the L-Nth element we wanted to delete
        first?.next = first?.next?.next
        
        return dummy?.next
    }
}

let tree = ListNode(1,ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
//let tree = ListNode(1,ListNode(2))

let s = Solution()
s.removeNthFromEnd(tree, 2)

