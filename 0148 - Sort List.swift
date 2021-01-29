// https://leetcode.com/problems/sort-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        
        var indexes: [Int] = []
        
        var head = head
        
        while head != nil {
            indexes.append(head!.val)
            head = head?.next
        }
        
        if indexes.isEmpty { return head }
        
        indexes.sort()
        
        /// Result that will be returned, add the first node from the array
        var newList: ListNode? = ListNode(indexes.removeFirst())
        
        /// Pointer that will be advancing and adding new nodes from the list
        var newPointerToEnd: ListNode? = newList
        
        /// Progressively empty the array of values, add the new value
        /// and advance to the next one
        while indexes.isEmpty == false {
            
            newPointerToEnd?.next = ListNode(indexes.removeFirst())
            newPointerToEnd = newPointerToEnd?.next
        }
        
        return newList
    }
}

//let head = ListNode(3, ListNode(1, ListNode(4, ListNode(2))))
let head = ListNode(-1, ListNode(5, ListNode(3, ListNode(4, ListNode(0)))))

Solution().sortList(head)

