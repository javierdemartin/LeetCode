// https://leetcode.com/problems/linked-list-random-node/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    var randomValues = [Int]()
    
    /** @param head The linked list's head.
     Note that the head is guaranteed to be not null, so it contains at least one node. */
    init(_ head: ListNode?) {
        
        var head = head
        
        while head != nil {
            randomValues.append(head!.val)
            head  = head?.next
        }
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        let randomIndex = Int.random(in: 0..<randomValues.count)
        return randomValues[randomIndex]
    }
}
