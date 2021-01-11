// https://leetcode.com/problems/maximum-depth-of-binary-tree/submissions/

/**
 This problem is a variation of Depth-First-Search. This algorithm is used to iterate and calculate the number of levels
 a tree has. This is done by using an array to keep track of the level we're currenyly at.
 */

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

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        
        var depth = [[Int]]()
        
        recursion(&depth, 0, root)
        
        return depth.count
    }
    
    func recursion(_ depth: inout [[Int]], _ level: Int, _ l: TreeNode?) {
        
        if l == nil { return }
        
        if level == depth.count {
            depth.append([])
        }
        
        depth[level].append(l!.val)
        
        if l?.left != nil {
            recursion(&depth, level + 1, l?.left)
        }
        
        if l?.right != nil {
            recursion(&depth, level + 1, l?.right)
        }
    }
}

//let tree = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
//let tree = TreeNode(1, TreeNode(2), nil)
//let tree = TreeNode(1,  nil, TreeNode(2))
//let tree: TreeNode? = nil
let tree = TreeNode(3, TreeNode(1), TreeNode(2))

Solution().maxDepth(tree)

