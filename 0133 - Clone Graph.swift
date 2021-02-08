/// https://leetcode.com/problems/clone-graph/

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    
    var visited = [Node: Node]()
    
    func cloneGraph(_ node: Node?) -> Node? {
        
        guard let node = node else { return nil }
        
        if let clonedNode = visited[node] {
            return clonedNode
        } 
 
        let newNode = Node(node.val)
        visited[node] = newNode
        
        for neighbor in node.neighbors {
            if let clonedNeighbor = cloneGraph(neighbor) {
                newNode.neighbors.append(clonedNeighbor)
            }
        }
        
        return visited[node]
    }
}
