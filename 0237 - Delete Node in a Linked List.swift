// https://leetcode.com/problems/delete-node-in-a-linked-list/

import Foundation

/**
 This question can be a bit misleading. You'd expect to receive a singly-linked list  and a value to delete.
 You're gonna get a reference to the node to be deleted and you need to update it. Given the following tree,
 the solution would be as folows:
 
 [4] --> [5] --> [1] --> [9]
 
 val: 4     -->   val: 5     -->   val: 1     -->   val: 9
 next: 5  -->   next: 1  -->   next: 9  -->   next: nil
 
 The task is to delete the node which has `val=5`. This process could be defined as updating the node's value
 reference rather than deleting it. This will be the reference passed to the question.
 
 val: 5    -->   val: 1     -->   val: 9
 next: 1  -->   next: 9  -->   next: nil
 
 You need to update it to be
 
 val: 1     -->   val: 9
 next: 9  -->   next: nil
 
 Time-complexity: O(1)
 Space-complexity: O(1)
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteNode(_ node: ListNode?) {
        
        node!.val = node!.next!.val
        node!.next = node!.next!.next
    }
}

let tree = ListNode(4, ListNode(5, ListNode(1, ListNode(9))))

/// Pass the reference to the second node which will be the node to delete
Solution().deleteNode(tree.next)

