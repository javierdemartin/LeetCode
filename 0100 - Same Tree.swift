// https://leetcode.com/problems/same-tree/

import Foundation

// Solution is similar as the one of problem 101

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

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

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return recursive(ln: p, rn: q)
    }
    
    func recursive(ln: TreeNode?, rn: TreeNode?) -> Bool {
        if (ln == nil && rn == nil) { return true }
        if (ln == nil || rn == nil) { return false }
        if (ln!.val != rn!.val) { return false }
        
        return (ln!.val == rn!.val)
            && recursive(ln: ln!.left, rn: rn!.left)
            && recursive(ln: ln!.right, rn: rn!.right)
    }
}

let p = TreeNode(1, TreeNode(2), TreeNode(3))
let q = TreeNode(1, TreeNode(2), TreeNode(3))

let s = Solution()
s.isSameTree(p, q)

