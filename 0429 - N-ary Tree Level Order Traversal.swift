'/// https://leetcode.com/problems/n-ary-tree-level-order-traversal/

import Foundation

  public class Node {
      public var val: Int
      public var children: [Node]
      public init(_ val: Int) {
          self.val = val
          self.children = []
      }
  }

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        
        guard let root = root else { return [] }
        
        var solution: [[Int]] = []
        
        solution.append([root.val])
        
        helper(root, &solution, 1)
        
        //solution.append(root.val)
        
        return solution
    }
    
    func helper(_ t: Node?, _ solution: inout [[Int]], _ level: Int) {
        
        guard let t = t else { return }
        
        if level == solution.count && !t.children.isEmpty {
            solution.append([])
        }
        
        for children in t.children {

            helper(children, &solution, level + 1)
            solution[level].append(children.val)
        }
    }
}
'
