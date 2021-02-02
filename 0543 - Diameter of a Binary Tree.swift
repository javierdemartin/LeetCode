/// https://leetcode.com/problems/diameter-of-binary-tree/

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
 Depth-first search
 
 Time complexity: O(N)
 Space complexity: O(N), size of the call stack during the depth-first search
 */
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        
        var numberOfNodes = 1
        
        recurse(root, &numberOfNodes)
        
        return numberOfNodes - 1
    }
    
    func recurse(_ l: TreeNode?, _ numberOfNodes: inout Int) -> Int {
        
        if l == nil {
            return 0
        }
        
        /// Calculate the number of nodes down each path
        let L = recurse(l?.left, &numberOfNodes)
        let R = recurse(l?.right, &numberOfNodes)
        
        numberOfNodes = max(numberOfNodes, L + R + 1)
        
        /// Add one unit to take into account the current node
        return max(L, R) + 1
    }
}

