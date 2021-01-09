// https://leetcode.com/problems/palindrome-linked-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var values = [Int]()
        
        var initial = head
        
        while initial != nil {
            values.append(initial!.val)
            initial = initial?.next
        }
        
        for i in 0..<Int(values.count/2) {
            print("\(values[i]) \(values[values.count - 1 - i])")
            if values[i] != values[values.count - 1 - i] {
                return false
            }
            
        }
        
        return true
    }
}

let tree = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))

let s = Solution()
let returned = s.isPalindrome(tree)

