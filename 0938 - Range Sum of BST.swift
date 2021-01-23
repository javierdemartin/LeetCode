// https://leetcode.com/problems/range-sum-of-bst/

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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        
        var sum = 0
        
        helper(low, high, &sum, root)
        
        return sum
    }
    
    func helper(_ min: Int, _ max: Int, _ sum: inout Int, _ tree: TreeNode?) {
        if tree != nil {
            
            
            helper(min, max, &sum, tree!.left)
            
            if tree!.val >= min && tree!.val <= max {
                sum += tree!.val
            }
            
            print(tree!.val)
            helper(min, max, &sum, tree!.right)
        }
    }
}

let tree = TreeNode(10,
                    TreeNode(5, TreeNode(3), TreeNode(7)),
                    TreeNode(15, nil, TreeNode(18)))

Solution().rangeSumBST(tree, 7, 15)

