/// https://leetcode.com/problems/n-ary-tree-postorder-traversal/

import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

/// MARK:  - Recursive approach

/**
 Recursive approach using Depth First Search (DFS). Start from a root and work all the way down the avaialble branches.
 
 This approach is
 
 Time complexity: O(N) due to the recursion stack
 Space complexity: O(N) to store all the values in the tree
 */

class SolutionRecursive {
    func postorder(_ root: Node?) -> [Int] {
        
        if root == nil { return [] }
        
        var solution: [Int] = []
        
        helper(root, &solution)
        
        solution.append(root!.val)
        
        print(solution)
        
        return solution
    }
    
    func helper(_ t: Node?, _ solution: inout [Int]) {
        
        if t != nil {
            
            for child in t!.children {
                helper(child, &solution)
                print(child.val)
                solution.append(child.val)
            }
            
        }
    }
}

/**
 Iterative approach
 */
class SolutionIterative {
    func postorder(_ root: Node?) -> [Int] {
        
        if root == nil { return [] }
        
        /// Stores the values of the traversal
        var solution: [Int] = []
        ///
        var queue: [Node] = []
        
        helper(root, &queue, &solution)
        
        return solution
    }
    
    func helper(_ t: Node?, _ queue: inout [Node], _ solution: inout [Int]) {
        
        guard let t = t else { return }
        
        queue.append(t)
        
        while queue.isEmpty == false {
            /// Go down level by level
            let node = queue.removeFirst()
            for children in node.children {
                helper(children, &queue, &solution)
            }
            
            /// We've reached the bottom, append the value
            solution.append(node.val)
        }
    }
}
