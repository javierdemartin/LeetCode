/// https://leetcode.com/problems/longest-palindromic-substring/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


/**
 Recursive solution by traversing the list with two pointers.
 Algorithm consists of getting to the end of the list, stopping the recursion there and when coming back
 progressively comparing a pointer pointing to the head if the values match (palindrome) if both match
 move forwards the `frontPointer`. The tail pointer will be moving automatically as the runtime stack is
 being resolved.
 
 Time complexity: O(N)
 Space complexity: O(N) due to the added runtime stack when using recursion.
 */
class Solution {
    
    private var frontPointer: ListNode? = nil
    
    private func recurse(_ head: ListNode?) -> Bool {
        
        if head != nil {
            if !recurse(head?.next) { return false }
            /// This makes sense because `frontPointer` will traverse the list from the beginning
            /// when the recursion has ended so `head` will be at the end
            print("Head \(head!.val) front \(frontPointer!.val)")
            if head!.val != frontPointer!.val { return false }
            /// Moving this pointer forward me manage to move the `frontPointer` to the right
            /// as the same time the `head` is moving backwards from the right side
            frontPointer = frontPointer?.next
        }
        
        return true
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        frontPointer = head
        
        return recurse(head)
    }
}

var head = ListNode(1, ListNode(3, ListNode(3, ListNode(1))))
Solution().isPalindrome(head)

