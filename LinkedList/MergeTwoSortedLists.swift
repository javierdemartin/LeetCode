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
 

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    	print("--------")
        
		guard let l1 = l1 else { 
			print("1")
			return l2 
		}
        guard let l2 = l2 else { 
    		print("2")
	        return l1 
        }    
    
        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
			print("3")
            return l1
        }
        
        l2.next = mergeTwoLists(l1, l2.next)
		print("4")
        return l2
    }
}


// First list
let first1 = ListNode(1)
let first2 = ListNode(2)
let first3 = ListNode(4)

first1.next = first2
first2.next = first3

// Second list
let second1 = ListNode(1)
let second2 = ListNode(3)
let second3 = ListNode(4)

second1.next = second2
second2.next = second3

let solution = Solution()
dump(solution.mergeTwoLists(first1, second1))