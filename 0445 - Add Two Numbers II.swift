/// https://leetcode.com/problems/add-two-numbers-ii/solution/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


/**
 As the given numbers do have their most significant digits first it's a good idea to reverse each list so the sum can be performed in an easier way.
 
 1. Reverse each input
 2. Compute the sum
 3. Add the possible remaining carry
 4. Reverse the solution
 */
class Solution {
    
    var solution: ListNode? = ListNode(0)
    var solutionHead: ListNode?
    var carry = 0
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        /// Reverse both inputs so the most significant left is on the right
        var t1 = reverse(l1)
        var t2 = reverse(l2)
        
        /// Head pointer of the solution
        let solution: ListNode? = ListNode(0)
        /// Pointer to the tail of the solution that will be built progressively
        var solutionHead: ListNode? = solution
        
        /// Iterate until both of the lists reach the end
        while t1 != nil || t2 != nil {
            
            /// If the inputs are of different size one of the linked lists will reach the end before the other
            /// In that case default the head value which would have been `nil` to a zero.
            let x = t1 != nil ? t1!.val : 0
            let y = t2 != nil ? t2!.val : 0
            
            /// Compute the current sum's value leaving out the carry for the next operation
            var sum = x + y + carry
            carry = sum / 10
            sum = sum % 10
            
            /// Add a new digit to the result and advance the pointer
            solutionHead!.next = ListNode(sum)
            solutionHead = solutionHead!.next
            
            /// Advance both pointers
            t1 = t1?.next
            t2 = t2?.next
        }
        
        /// Check if there is any carry left to sum to the solutiom
        if carry > 0 {
            solutionHead?.next = ListNode(1)
            solutionHead = solutionHead?.next
        }
        
        /// Reverse the built sum so that the most significative digit is on the left
        let reversed = reverse(solution?.next)
        
        return reversed
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        
        let reversed = reverse(head?.next)
        
        head?.next?.next = head
        head?.next = nil
        
        return reversed
    }
}

//var l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
//var l2 = ListNode(1, ListNode(5))

var l1 = ListNode(1, ListNode(9,ListNode(5)))
var l2 = ListNode(5)

Solution().addTwoNumbers(l1, l2)

