// https://leetcode.com/problems/linked-list-cycle-ii/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 Can't use a simple dictionary to store the current head's value and number of times visited because `ListNode` doesn't conform to hashable.
 
 By using a set that contains each node's pointer in memory we can check if a cycle exists as when a new node's pointer is not inserted into the set because it's already there.
 */
class Solution {
    
    /**
     space-complexity: O(1)
     time-complexity: O(N)
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast { break }
        }
        
        if fast == nil { return nil }
        
        slow = head
        
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
        
    }
    
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        
        var visits: Set<UnsafeMutableRawPointer> = []
        
        var head = head
        
        while head != nil {
            
            if !visits.insert(Unmanaged.passUnretained(head!).toOpaque()).inserted {
                return head
            }
            
            head = head?.next
        }
        
        return nil
    }
}

let l1 = ListNode(3)
let l2 = ListNode(2)
let l3 = ListNode(0)
let l4 = ListNode(-4)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l2

Solution().detectCycle(l1)


