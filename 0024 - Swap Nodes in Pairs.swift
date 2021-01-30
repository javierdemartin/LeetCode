// https://leetcode.com/problems/swap-nodes-in-pairs/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Swapping the nodes in pairs it's actually swapping the head's values, nothing fancier.
 
 The problem is being framed as a recursision where the condition to stop is when there are no more pairs to swap
 
 Time complexity: O(N) where N is the size of the linked list
 Space complexity: O(N) stack space used for recursion
 */

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        helper(head)
        
        return head
    }
    
    func helper(_ pointer: ListNode?) -> ListNode? {
                
        /// No more pairs to invert on the list
        if pointer?.next == nil { return pointer }
        
        /// Swap the pairs
        let temp = pointer!.next!.val
        pointer!.next!.val = pointer!.val
        pointer!.val = temp
                
        /// Advance the head's pointer to the next pair
        return helper(pointer?.next?.next)
    }
}

var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))

dump(Solution().swapPairs(head))


