// https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/

import Foundation

/**
 [4,3,2,-1]
 [3,2,1,-1]
 [1,1,-1,-2]
 [-1,-1,-2,-3]
 
 [+ + + -]
 [+ + + -]
 [+ + - -]
 [-  -  -  -]
 */

class Solution {
    
    /**
     
     O(N+M) complexity
     
     Start iterating from the first column on the last row, from top to bottom.
     
     1. If a non-negative number is found move one column to the right
     2. If a negative number is found we know the elements that are left on the row are also gonna be negative elements. Add them to the count by substracting the number of columns minus the current column we're in
     */
    func countNegatives(_ grid: [[Int]]) -> Int {
        
        var count = 0
        
        
        if grid[grid.count - 1][grid[0].count - 1] >= 0 { return 0 }
        
        var col = 0
        var row = grid.count - 1
        
        while row >= 0 && col < grid[0].count {
            if grid[row][col] < 0 {
                print("Adding \(grid[0].count - col)")
                count += grid[0].count - col
                row -= 1
                
            } else {
                col += 1
            }
        }
        
        return count
    }
    
    func countNegatives2(_ grid: [[Int]]) -> Int {
            var result = 0
            var col = 0
            var row = grid.count - 1
            
            while row >= 0 && col < grid[0].count {
                if grid[row][col] < 0 {
                    result += grid[0].count - col
                    row -= 1
                } else {
                    col += 1
                }
            }
            
            return result
        }
}

Solution().countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])

