// https://leetcode.com/problems/path-sum-ii/

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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        
        
        var paths = [[Int]]()
        var path = [Int]()
        
        findPaths(root, sum, &paths, &path)
        
        return paths
    }
    
    func findPaths(_ root: TreeNode?, _ sum: Int, _ paths: inout [[Int]], _ currentPath: inout [Int]) {
        
        guard let root = root else { return }
        
        // Add
        currentPath.append(root.val)
        
        if root.val == sum && root.left == nil && root.right == nil {
            paths.append(currentPath)
        }
        
        findPaths(root.left, sum - root.val, &paths, &currentPath)
        findPaths(root.right, sum - root.val, &paths, &currentPath)
        // A path couldn't be found, remove the provisional element added previously
        currentPath.removeLast()
    }
}

let tree = TreeNode(5,
                    TreeNode(4,
                             TreeNode(11, TreeNode(7), TreeNode(2)),
                             nil),
                    TreeNode(8,
                             TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1))))

let s = Solution()
s.pathSum(tree, 22)

