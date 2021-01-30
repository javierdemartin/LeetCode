// https://leetcode.com/problems/search-in-a-binary-search-tree/

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
 Time complexity: O(H), where H is the height of the BST. O(N) would be the worst case
 Space complexity: O(H), where H is the height of the BST
 */

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
        /// Reached the end where no more nodes are a possible match
        if root == nil  { return nil }
        
        /// Condition to stop the recursion and return the result
        if root?.val == val { return root }
        
        /// Search the right side as the value we're looking for is greater than the BST's value
        if root!.val < val { return searchBST(root?.right, val) }
        /// Search the left side as the value we're looking for is less than the BST's value
        if root!.val > val { return searchBST(root?.left, val) }
        
        return nil
    }
}

var tree = TreeNode(4,
                    TreeNode(2, TreeNode(1), TreeNode(3)),
                    TreeNode(7))

dump(Solution().searchBST(tree, 2))

