// https://leetcode.com/problems/add-two-numbers/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var dummy: ListNode? = ListNode(0)
        var one = l1, two = l2
        
        var curr: ListNode? = dummy
        
        var carry = 0
        
        while one != nil || two != nil {
            let x = one != nil ? one!.val : 0
            let y = two != nil ? two!.val : 0
            
            let sum = x + y + carry
            
            carry = sum / 10
            
            curr!.next = ListNode(sum % 10)
            curr = curr!.next // Advance
            
            one = one?.next
            two = two?.next
        }
        
        if carry > 0 {
            curr?.next = ListNode(carry)
        }

        return dummy!.next
    }
    
    func addNode(_ h: ListNode?, _ val: Int) {
        
        var h = h
        
        while h?.next != nil {
            h = h!.next
        }
        
        h?.next = ListNode(val)
    }
}

let a = ListNode(2, ListNode(4, ListNode(3)))
let b = ListNode(5, ListNode(6, ListNode(4, ListNode(1))))

let s = Solution()
dump(s.addTwoNumbers(a, b))

