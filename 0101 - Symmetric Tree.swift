// https://leetcode.com/problems/symmetric-tree/

import Foundation

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
     
        return checkSymmetry(ln: root, rn: root)
    }
    /**
     Recursive aproach. Two trees are a mirror reflection if:
     
     1. Both branches have their same root value
     2. The right subtree of each subtree is a mirror reflection of the left subrtree of the other tree
     */
    func checkSymmetry(ln: TreeNode?, rn: TreeNode?) -> Bool {
        if (ln == nil && rn == nil) { return true }
        if (ln == nil || rn == nil) { return false }
        return ln!.val == rn!.val
            && checkSymmetry(ln: ln!.left, rn: rn!.right)
            && checkSymmetry(ln: ln!.right, rn: rn!.left)
    }
    
    // MARK: - Other solution, iterative approach
    
    /**
     Iterative with the aid of a queue. Each two consecutive nodes in the queue should be equal and their trees a mirror of each other.
     
     Remember that a quque implements FIFO ordering, as in a line queue.
     */
    func isSymmetric2(_ root: TreeNode?) -> Bool {
     
        guard let root = root else { return true }
        
        var queue = [root.left, root.right]
        
        while !(queue.isEmpty) {
            let t1 = queue.removeLast()
            let t2 = queue.removeLast()
            
            if t1 == nil && t2 == nil { continue }
            if t1 == nil || t2 == nil { return false }
            if (t1!.val != t2!.val) { return false }
            
            queue.append(t1!.left)
            queue.append(t2!.right)
            queue.append(t1!.right)
            queue.append(t2!.left)
        }
        
        
        return true
    }
}

let s = Solution()
let tree = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))

s.isSymmetric2(tree)

