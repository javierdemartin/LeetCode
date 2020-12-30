// https://leetcode.com/problems/path-sum/

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

/**
 Approach using recursion and Depth-first Search (DFS)
 */
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        // If root node is already null result won't exist
        guard let root = root else { return false }
        
        var sumation = sum
        
        // Decrease the current root head value
        sumation -= root.val
        
        // If both nodes are null check if we've reached the solution.
        if root.left == nil && root.right == nil {
            return (sumation == 0)
        } else {
            return hasPathSum(root.left, sumation) || hasPathSum(root.right, sumation)
        }
    }
}

let tree = TreeNode(5,
                    TreeNode(4,
                             TreeNode(11, TreeNode(7), TreeNode(2)),
                             nil),
                    TreeNode(8,
                             TreeNode(13), TreeNode(4, nil, TreeNode(1))))

let s = Solution()
s.hasPathSum(tree, 22)

