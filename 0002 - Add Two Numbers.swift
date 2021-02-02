// https://leetcode.com/problems/add-two-numbers/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Create a new linked list which is going to store the solution and moving a dummy pointer to it while iterating both input lists.
 Take into the account the possible carry on each step and also in the end.
 
 Time complexity: O(max(M,N)), linear with the inputs
 Space Complexity: O(max(M,N)), linear with the inputs
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1, l2 = l2
        let dummy: ListNode? = ListNode(0)
        var head: ListNode? = dummy
        
        var carry = 0
        
        while l1 != nil || l2 != nil {
            
            let x = l1 != nil ? l1!.val : 0
            let y = l2 != nil ? l2!.val : 0
            
            print("Adding \(x) and \(y) with \(carry)")
            let sum = x + y + carry
            
            
            carry = sum / 10
            
            head!.next = ListNode(sum % 10)
            head = head!.next
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        
        /// Add the possible carry
        if carry > 0 {
            head?.next = ListNode(carry)
        }
        
        return dummy?.next
    }
    
}


let a = ListNode(2, ListNode(4, ListNode(3)))
let b = ListNode(5, ListNode(6, ListNode(4, ListNode(1))))

Solution().addTwoNumbers(a, b)

