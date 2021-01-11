// https://leetcode.com/problems/binary-tree-level-order-traversal/

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
Breadth-first-search consists of visiting the tree in levels going from top to bottom.
 
 This algorithm needs an array to keep track of the levels that have been visited so far. The length of this list shows the depth of the tree.
 
 If the length of the list is the same to the current level we're at add a new element as we've reached a new one below.
 
 Recursively process child nodes if they're not nil adding a new level of depth
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var result: [[Int]] = []
        
        recursion(&result, 0, root)
        
        return result
    }
    
    func recursion(_ queue: inout [[Int]], _ level: Int, _ l: TreeNode?) {
        
        print("LEVEL \(level)")
        
        if l == nil {
            return
        }
        
        // queue.count is the current level we're at
        
        if level == queue.count {
            queue.append([])
        }
        
        queue[level].append(l!.val)
        
        if l?.left != nil {
            recursion(&queue, level + 1, l?.left)
        }

        if l?.right != nil {
            recursion(&queue, level + 1, l?.right)
        }
    }
}

//let tree = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
//let tree = TreeNode(1, TreeNode(2), nil)
//let tree = TreeNode(1,  nil, TreeNode(2))
//let tree: TreeNode? = nil
let tree = TreeNode(3, TreeNode(1), TreeNode(2))

Solution().levelOrder(tree)

