// https://leetcode.com/problems/pascals-triangle/

import Foundation

/**
 In my head thinking of a triangle with arrays is difficult. The Pascal triangle can be seen like this too,
 
 1
 1 1
 1 2 1
 1 2 2 1
 
 Start with a pre-computed solution containing `[[1],[1,1]]`. On each row the first and last values will be inserted manually.
 The calculation of each value is: `currentRow  = previousRow[i] + previousRow[i-1]`. Bear in mind that all of this is
 1-indexed.
 */
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        if numRows == 0 { return [] }
        if numRows == 1 { return [[1]] }
        if numRows == 2 { return [[1],[1,1]]}
     
        var solution: [[Int]] = [[1],[1,1]]
        
        for i in 3...numRows {
            solution.append([1])
            
            for j in 1..<i-1 {
                solution[i-1].append(solution[i-2][j-1] + solution[i-2][j])
            }
            
            solution[i-1].append(1)
        }
        
        return solution
    }
}
