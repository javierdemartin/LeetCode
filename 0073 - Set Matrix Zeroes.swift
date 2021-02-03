/// https://leetcode.com/problems/set-matrix-zeroes/

import Foundation

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        // Find the positions mxn in which the zeroes are located
        var zeroesRows: [Int] = []
        var zeroesColumns: [Int] = []
        for row in 0..<matrix.count {
            
            // Find the rows in which there's a zero
            if matrix[row].contains(where: {$0 == 0}) {
                zeroesRows.append(row)
            }
        }
        
        // Find every column's zeroes index
        for column in 0..<matrix[0].count {
            
            let cols = matrix.compactMap({ $0[column] }).enumerated().compactMap({ $0.element == 0 ? $0.offset : nil })
            
            print(cols)
            
            
            print("----------")
            
            if !cols.isEmpty {
                zeroesColumns.append(column)
            }
            
//            zeroesColumns.append(contentsOf: cols)

        }
        
        // Set every row's value as zeroes
        for row in zeroesRows {
            matrix[row] = Array(repeating: 0, count: matrix[row].count)
        }
        
        for columns in zeroesColumns {
            for rows in 0..<matrix.count {
                matrix[rows][columns] = 0
            }
        }
    }
}

let s = Solution()
//var matrix = [[1,1,1],[1,0,1],[1,1,1]]
//s.setZeroes(&matrix)

var matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
s.setZeroes(&matrix) // [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

print("------------")
print(matrix)

