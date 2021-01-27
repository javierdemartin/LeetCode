// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 A brute force solution would be to calculate the depth of the given list and then perform the operation. That operation
 needs multiple passes over the list to perform the operation but it's a valid solution.
 
 An improved solution involves using two pointers.
 
 * First pointer advanced `n + 1` from the beginning
 * Second pointer starts from the beginning of the list
 
 This causes that these two pointers are separated `n` nodes apart.
 
 By cycling the linked list until the first pointer reaches the end the second pointer will have stopped at the `nth` node counting from the end.
 
 Relink the next pointer of the next node to pointe to the node's next next node.
 
 Time complexity: O(N)
 Space complexity: O(1)
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head
        
        var node = dummy
        var ahead = dummy
        
        for _ in 0..<n {
            ahead = ahead?.next
        }
        
        while ahead?.next != nil {
            node = node?.next
            ahead = ahead?.next
        }
        
        
        node?.next = node?.next?.next
        
        return dummy!.next
    }
}

let tree = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

Solution().removeNthFromEnd(tree, 2)

