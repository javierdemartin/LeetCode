// https://leetcode.com/problems/unique-paths/

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        // Initialize a m x n array with values set to 1
        // Each number represents the number of ways to reach it
        var paths = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        // Iterate from left to right from top to bottom
        // Since you're only allowed to move to the right or down the ways to reach a cell
        // Is the sum of ways to reach the cell above and cell  on the left
        for row in 1..<paths.count {
            for column in 1..<paths[0].count {
                paths[row][column] = paths[row][column - 1] + paths[row - 1][column]
            }
        }
        
        // The last cell (bottom right) will store the number of unique paths
        return paths[m-1][n-1]
    }
}

let s = Solution()
s.uniquePaths(3, 4)

