// https://leetcode.com/problems/binary-tree-level-order-traversal-ii/

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
 The solution asks for a level-by-level traversal of the tree, this is done by implementing a Breadth-First Search (BFS) traversal.
 
 Contrary to Depth-First Search (DFS) methods, Breadth-First Search (BFS) is not a recursive operation. It uses a queue to explore the tree.
 
 Finally, reverse the array as it asks for a bottom-up traversal.
 */
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        
        var treeValues: [[Int]] = []
        
        bfsTraverseTopToBottom(&treeValues, root, 0)
        
        return treeValues.reversed()
    }
    
    func bfsTraverseTopToBottom(_ depthLevels: inout [[Int]], _ tree: TreeNode?, _ level: Int) {
        
        if tree == nil { return }
        
        if level == depthLevels.count {
            depthLevels.append([])
        }
        
        depthLevels[level].append(tree!.val)
        
        if tree?.left != nil {
            bfsTraverseTopToBottom(&depthLevels, tree?.left, level + 1)
        }
        
        if tree?.right != nil {
            bfsTraverseTopToBottom(&depthLevels, tree?.right, level + 1)
        }
    }
}

let tree = TreeNode(3,
                    TreeNode(9),
                    TreeNode(20, TreeNode(15), TreeNode(7)))

Solution().levelOrderBottom(tree)

