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
    func reverseList(_ head: ListNode?) -> ListNode? {
    	
    	var temp: ListNode?
    	var first = head
    	
    	while first != nil {
   	
   			let second = first!.next
   			
   			first!.next = temp
   			
   			temp = first
   			first = second
   		}
        
        return temp
    }
}

let list = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

let solution = Solution()

dump(solution.reverseList(list))