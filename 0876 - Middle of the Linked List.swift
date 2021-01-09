// https://leetcode.com/problems/middle-of-the-linked-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var h = head
        
        var values = [Int]()
        
        while h != nil {
            values.append(h!.val)
            h = h?.next
        }
        
        values = Array(values[Int(values.count/2)..<values.count])
        
        h = ListNode(0)
        
        for i in values {
            appendToTail(h, val: i)
        }
        
        return h!.next
    }
    
    func appendToTail(_ n: ListNode?, val: Int) {
        
        var n = n
        
        while n?.next != nil {
            n = n!.next
        }
        
        n?.next = ListNode(val)
    }
}

let a = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
let b = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6))))))

let s = Solution()
dump(s.middleNode(b))


