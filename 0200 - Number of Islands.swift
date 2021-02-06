/// https://leetcode.com/problems/number-of-islands/

import Foundation

/**
Aprpoach the grid as a map that can be traversed.
Linear scan of the 2D map. If a coordinate (X,Y) contains a "1" it triggers a
Depth First Search. During each visit mark the current node as visited by
changing it value to not be a "1".

Time complexity: O(NxM)
Space complexity: O(NxM)
*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var islands = 0
        var grid = grid
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                print(row, col)
                if grid[row][col] == "1" {
                    islands += 1
                    dfs(&grid, row, col)
                }
            }
        }
        
        return islands
    }
    
    func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) {
        
        let nr = grid.count
        let nc = grid[0].count
        
        /// Mark the current node as visited so in future iterations
        /// it's not mistaken as a non-visited node
        /// You can use any value except 1 for obvious reasons
        grid[r][c] = "2"
        /// Top
        if r-1 >= 0 && grid[r-1][c] == "1" { dfs(&grid, r-1, c) }
        /// Bottom
        if r+1 < grid.count && grid[r+1][c] == "1" { dfs(&grid, r+1, c) }
        /// Left
        if c-1 >= 0 && grid[r][c-1] == "1" { dfs(&grid, r, c-1) }
        /// Right
        if c+1 < grid[0].count && grid[r][c+1] == "1" { dfs(&grid, r, c+1) }
    }
    
}


