// https://leetcode.com/problems/merge-k-sorted-lists/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 
 1. Iterate the array of linked lists to fill an array containing all the nodes
 2. Sort the values of the array
 3. Build the resulting linked list
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
                
        var elements: [Int] = []
        
        // 1. Iterate the array of linked lists to fill an array containing all the nodes
        for list in lists {
            
            var list = list
            
            while list != nil {
                elements.append(list!.val)
                list = list?.next
            }
        }
        
        if elements.isEmpty { return nil }
        
        // 2. Sort the values of the array
        for i in 0..<(elements.count-1) {
            for j in (i+1)..<elements.count {
                if elements[i] > elements[j] {
                    let temp = elements[j]
                    elements[j] = elements[i]
                    elements[i] = temp
                }
            }
        }
        
        // 3. Build the resulting linked list
        let list = ListNode(0)
        var head = list
        
        for i in elements {
            // create the new node
            head.next = ListNode(i)
            // Advance the position in the list
            head = head.next!
        }
        
        return list.next
    }
}

let lists = [ListNode(1, ListNode(4, ListNode(5))), ListNode(1, ListNode(3, ListNode(4))), ListNode(2, ListNode(6))]

Solution().mergeKLists(lists)

