// https://leetcode.com/problems/merge-two-sorted-lists/

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1, l2 = l2
        
        var newHead: ListNode? = ListNode(0)
        var merged = newHead
        
        while l1 != nil && l2 != nil {
            let v1 = l1!.val
            let v2 = l2!.val
            
            if v1 <= v2 {
                merged?.next = l1
                l1 = l1!.next
            } else if v2 < v1 {
                merged?.next = l2
                l2 = l2!.next
            }
            
            merged = merged?.next
        }
        
        merged?.next = l1 ?? l2
        
        return newHead?.next
    }
}

let l1 = ListNode(1, ListNode(2, ListNode(3)))

let l2 = ListNode(1, ListNode(3, ListNode(4)))

dump(Solution().mergeTwoLists(l1, l2))

