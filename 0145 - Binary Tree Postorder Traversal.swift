// https://leetcode.com/problems/binary-tree-postorder-traversal/

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
Postorder traversal consists of traversing the left node, then to the right and then visit the root.
 */
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var solution = [Int]()
        
        recursive(&solution, root)
        
        return solution
    }
    
    func recursive(_ stack: inout [Int], _ l: TreeNode?) {
        
        if l == nil { return }
        
        if l?.left != nil {
            recursive(&stack, l?.left)
        }
        
        if l?.right != nil {
            recursive(&stack, l?.right)
        }
        
        // Only append the value once the left and right sides have been explored
        stack.append(l!.val)
    }
}

let tree = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
//let tree = TreeNode(1, TreeNode(2), nil)
//let tree = TreeNode(1,  nil, TreeNode(2))
//let tree: TreeNode? = nil
//let tree = TreeNode(3, TreeNode(1), TreeNode(2))

Solution().postorderTraversal(tree)

