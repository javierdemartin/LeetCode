/// https://leetcode.com/problems/intersection-of-two-linked-lists/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 Traverse `headA` and store in a set each reference to the heads.
 
 Iterate `headB`, if any head reference of B appears in the previous set that means that point is the start of the intersection.
 
 Time complextiy: O(M+N)
 Space complexity: O(M) or O(N)
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var headA = headA, headB = headB
                
        
        var stackA: Set<UnsafeMutableRawPointer> = []

        while headA != nil {
            
            stackA.insert(Unmanaged.passUnretained(headA!).toOpaque())
            
            headA = headA?.next
        }
        
        while headB != nil {
            if stackA.contains(Unmanaged.passUnretained(headB!).toOpaque()) {
                return headB
            }
            
            headB = headB?.next
        }
        
        /// No intersection has been found
        return nil
    }
}

