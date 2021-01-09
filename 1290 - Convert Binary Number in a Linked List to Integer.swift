// https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        
        var h = head
        
        var values = ""
        
        while h != nil {
            values += "\(h!.val)"
            h = h?.next
        }
        
        return Int(values, radix: 2)!
    }
}

let a = ListNode(1, ListNode(0, ListNode(1)))

let s = Solution()
s.getDecimalValue(a)

