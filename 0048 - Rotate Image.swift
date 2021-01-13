// https://leetcode.com/problems/rotate-image/

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        
        // Transpose
        for i in 0..<matrix.count {
            for j in i..<matrix.count {
                let temp = matrix[j][i]
                matrix[j][i] = matrix[i][j]
                matrix[i][j] = temp
            }
        }
        
        // Mirror vertically
        for row in 0..<matrix.count {
            for col in 0..<matrix.count/2 {
                let temp = matrix[row][col]
                matrix[row][col] = matrix[row][matrix.count - col - 1]
                matrix[row][matrix.count - col - 1] = temp
                
            }
        }
    }
}

//var matrix = [[1,2],[3,4]]
var matrix = [[1,2,3],[4,5,6],[7,8,9]]

Solution().rotate(&matrix)

