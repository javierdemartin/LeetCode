// https://leetcode.com/problems/binary-tree-inorder-traversal/

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
 In-order traversal consists of traversing the left subtree, then the root & then the rigth subtree.
 
 1. If root's not nil
 2. Start traversing the left tree recursively
 3. If left is nil, recursively traverse root again
 4. Append node value to the stack
 5. if right's not nil traverse right path

 Time complexity: O(n)
 Space complexity: O(n)
 */
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var solution = [Int]()
        
        recursion(&solution, root)
        
        return solution
        
    }
    
    func recursion(_ stack: inout [Int], _ n: TreeNode?) {

        if n == nil {
            return
        }
        
        if n?.left != nil {
            recursion(&stack, n?.left)
        }
        
        stack.append(n!.val)
        
        if n?.right != nil {
            recursion(&stack, n?.right)
        }
        
    }
}

//let tree = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
let tree = TreeNode(1, TreeNode(2), nil)
//let tree = TreeNode(1,  nil, TreeNode(2))
//let tree: TreeNode? = nil
//let tree = TreeNode(3, TreeNode(1), TreeNode(2))

Solution().inorderTraversal(tree)

