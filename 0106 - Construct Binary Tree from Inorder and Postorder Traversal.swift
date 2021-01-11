// https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/

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
 In-order & post-order tree traversal are both Depth First Search algorithms.
 The way both algorithms build the traversed array can be simplified as follows:
 - in-order: inOrder(root.left) + root.val + inOrder(root.right)
 - post-order: postOrder(root.left) + postOrder(root.right) + root.val
 
 Now we can understand how the given arrays have been built so we can build our tree now.
 
 Using the last element of `postorder` we have `root.val` and all the elements to the left
 are going to be the tree's leaves.
 
 Find the obtained `root.val` from `postorder` in `inorder` this will separate the elements
 to the right and left.
 
 Time to buld the tree, use as help the postorder (or preorder if given), not inorder. With these two we
 already know the number of nodes that are to the left and to the right. And the `postorder` stores
 its values in that order specifically.
 
 
 */
class Solution {
    
    var idx: Int = 0
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        if inorder.count != postorder.count { return nil }
        if inorder.count == 0 { return nil }
        
        idx = postorder.count - 1
        
        return helper(inorder, postorder, 0, idx)
    }
    
    func helper(_ inorder: [Int], _ postorder: [Int], _ start:Int, _ end: Int)-> TreeNode? {

        // No more lements left to build subtrees from
        if start > end { return nil }
        
        // Pick up the current post index as the root value
        let node = TreeNode(postorder[idx])
        
        // Recursively traverse the post-order array from right to left to
        // build the tree in that order.
        idx -= 1
        
        // We've reached a head
        if start == end { return node }
        
        // Get the
        let index = getIndex(end, node.val, inorder)
        
        // As we're using post-order traverse start building the tree from the right
        node.right = helper(inorder, postorder, index + 1, end)
        node.left = helper(inorder, postorder, start, index - 1)
        
        return node
    }
    
    func getIndex(_ end: Int, _ nodeVal: Int, _ inorder: [Int]) -> Int {
        for i in (0...end).reversed() {
            if inorder[i] == nodeVal {
                return i
            }
        }
        
        return 0
    }
}

Solution().buildTree([9,3,15,20,7], [9,15,7,20,3])


