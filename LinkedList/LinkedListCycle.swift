// Source: https://leetcode.com/problems/linked-list-cycle/

// Given a linked list, determine if it has a cycle in it.

// To represent a cycle in the given linked list, we use an integer pos which represents 
// the position (0-indexed) in the linked list where tail connects to. If pos is -1, then 
// there is no cycle in the linked list.

// Solution: Cant use a Set/HashTable because the ListNode is not conforming to Hashable
// So I will use the fast/slow nodes/pointers. The fast runs at double speed

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
    
    	guard let head = head, let next = head.next else {
    		return false
    	}
    	
    	var slow: ListNode? = head
    	var fast: ListNode? = next
    	
    	while slow !== fast {
    	
    		if slow == nil || fast == nil {
    			return false
    		}
    		
    		slow = slow?.next
    		fast = fast?.next?.next
    	
    	}
    	
    	return true
    }
}

let solution = Solution()

var firstNode = ListNode(3)
var secondNode = ListNode(2)
var thirdNode = ListNode(0)
var fourthNode = ListNode(-4)

firstNode.next = secondNode
secondNode.next = thirdNode
thirdNode.next = fourthNode
fourthNode.next = secondNode

dump(firstNode)

dump(solution.hasCycle(firstNode))