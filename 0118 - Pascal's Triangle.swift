// https://leetcode.com/problems/pascals-triangle/submissions/

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        var solution: [[Int]] = []
        
        if numRows == 0 { return solution}

        solution = [[1]]
        
        for level in 1..<numRows {
            solution.append([1])
            
            let prevLevel = solution[level-1]
            
            for i in 1..<level {
                solution[level].append(prevLevel[i-1] + prevLevel[i])
            }
            
            solution[level].append(1)
        }
        
        return solution
    }
}

Solution().generate(3)

