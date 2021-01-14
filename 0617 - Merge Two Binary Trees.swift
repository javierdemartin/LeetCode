// https://leetcode.com/problems/merge-two-binary-trees/

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

/**
 Recursion approach
 */
class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        
        // If either of the nodes is nil there's no need to merge
        // them, just return it.
        if t1 == nil { return t2 }
        if t2 == nil { return t1 }
        
        // If both nodes exist, we need to merge them
        t1!.val += t2!.val
        
        t1!.left = mergeTrees(t1!.left, t2!.left)
        t1!.right = mergeTrees(t1!.right, t2!.right)
        
        return t1
    }
}

let t1 = TreeNode(1, TreeNode(3, TreeNode(5), nil), TreeNode(2))
let t2 = TreeNode(2,
                  TreeNode(1, nil, TreeNode(4)),
                  TreeNode(3, nil, TreeNode(7)))

Solution().mergeTrees(t1, t2)

