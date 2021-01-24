// https://leetcode.com/problems/spiral-matrix/

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var result = [Int]()
        
        if matrix.count == 0 || matrix[0].count == 0 {
            return result
        }
        
        var rowStart = 0
        var rowEnd = matrix.count - 1
        var colStart = 0
        var colEnd = matrix[0].count - 1
        
        
        while(rowStart <= rowEnd && colStart <= colEnd) {
            for i in stride(from: colStart, through: colEnd, by: 1) {
                result.append(matrix[rowStart][i])
            }
            
            rowStart += 1
            for i in stride(from: rowStart, through: rowEnd, by: 1) {
                result.append(matrix[i][colEnd])
            }
            
            colEnd -= 1
            
            if rowStart <= rowEnd {
                for i in stride(from: colEnd, through: colStart, by: -1) {
                    result.append(matrix[rowEnd][i])
                }
                
                rowEnd -= 1
            }
            
            if colStart <= colEnd {
                for i in stride(from: rowEnd, through: rowStart, by: -1) {
                    result.append(matrix[i][colStart])
                }
                
                colStart += 1
            }
        }
        
        return result
        
    }
}

let a = [[1, 1, 1, 1, 1, 1, 1],
         [1, 2, 2, 2, 2, 2, 1],
         [1, 2, 3, 3, 3, 2, 1],
         [1, 2, 2, 2, 2, 2, 1],
         [1, 1, 1, 1, 1, 1, 1]]

Solution().spiralOrder(a)

