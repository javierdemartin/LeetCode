// https://leetcode.com/problems/count-univalue-subtrees/

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
 There are two possible cases in which a node can be considered a valid univalue subtree:
 1. Node has no children (base case)
 2. All of the current node's children are univalue subtrees
 
 How to traverse the tree? Depth-first search. Breadth-first search is not suitable for this as we're
 not inspecting the tree in a horizontal direction.
 
 The second bullet point will require a recursive/iterative approach to validate the condition.
 
 Needed variables:
 - Counter (Integer): Stores the valid subtrees
 
 Steps:
 
 1. Initialize the counter to zero
 2. Check if the given tree is already nil which will stop the execution of the algorithm
 3. Start the recursive/iterative approach
 4. If both left and right children of the current node are nil increase the count
 
 - Time complexity: O(N), we need to go as deep as the tree is to check all the possible children
 - Space complexity: O(H), H being the height of the tree.
 */
class Solution {
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
       
        var count = 0
        
        if root == nil { return 0 }
        
        recursion(&count, root)
        
        return count
    }
    
    func recursion(_ count: inout Int, _ l: TreeNode?) -> Bool {
        
        if l?.left == nil && l?.right == nil {
            count += 1
            return true
        }
        
        // Assume right off the bat that's a unique subtree
        // Whether it's unique it'll be checked  in the two
        // conditions below
        var isUnique = true
        
        if l?.left != nil {
            isUnique = recursion(&count, l?.left) && isUnique && l!.val == l!.left?.val
        }
        
        if l?.right != nil {
            isUnique = recursion(&count, l?.right) && isUnique && l!.val == l!.right?.val
        }
        
        if !isUnique { return false }
        
        count += 1
        
        return true
    }
}

let tree = TreeNode(5,
                    TreeNode(1,
                            TreeNode(5), TreeNode(5)),
                    TreeNode(5,
                             nil, TreeNode(5)))
//let tree = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
//let tree = TreeNode(1, TreeNode(2), nil)
//let tree = TreeNode(1,  nil, TreeNode(2))
//let tree: TreeNode? = nil
//let tree = TreeNode(3, TreeNode(3), TreeNode(1))

Solution().countUnivalSubtrees(tree)


