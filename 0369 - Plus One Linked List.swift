/// https://leetcode.com/problems/plus-one-linked-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Time complexity: O(N)
 Space complexity: O(1)
 */
class Solution {
    func plusOne(_ head: ListNode?) -> ListNode? {
        
        var rev = reverse(head)
        var revTail = rev
        
        var carry = 1
        
        while revTail != nil {
            
            var val = revTail!.val + carry
            
            revTail!.val = val % 10
            revTail = revTail?.next
            
            carry = val / 10
        }
        
        var result = reverse(rev)
        
        if carry == 1 {
            let node = ListNode(carry)
            node.next = result
            return node
        }
        
        return result
    }
    
    func reverse(_ t: ListNode?) -> ListNode? {
        
        if t == nil || t?.next == nil { return t }
        
        let revHead = reverse(t?.next)
        
        t?.next?.next = t
        t?.next = nil
        
        return revHead
    }
}
