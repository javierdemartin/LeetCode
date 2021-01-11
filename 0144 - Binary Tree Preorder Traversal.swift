// https://leetcode.com/problems/binary-tree-preorder-traversal/

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
 Pre-order traversal consists on starting from the root node and start on the left side until the end is reached. Only then
 start traversing to the right.
 
 1. Start from the root, checking if it's not nil, if it's not
 2. Add the current node's value to the stack then
 3.1. If left node is not nil, recursively call 1 to traverse to the left
 3.2. If right node it not nil, recursively call 1 to traverse to the right
 
 Execution will end once we've reached the rightmost node, which in pre-order traversal marks the end.
 */
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var nodes = [Int]()
        
        iterate(&nodes, root)
        
        return nodes
    }
    
    func iterate(_ nodes: inout [Int], _ l: TreeNode?) {
        
        if l == nil { return }
        
        nodes.append(l!.val)
        
        if l?.left != nil {
            iterate(&nodes, l?.left)
        }
        
        if l?.right != nil {
            iterate(&nodes, l?.right)
        }
    }
}

//let tree = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
//let tree = TreeNode(1, TreeNode(2), nil)
//let tree = TreeNode(1,  nil, TreeNode(2))
let tree: TreeNode? = nil
//let tree = TreeNode(3, TreeNode(1), TreeNode(2))

Solution().preorderTraversal(tree)

