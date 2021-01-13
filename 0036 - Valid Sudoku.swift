 // https://leetcode.com/problems/intersection-of-two-arrays-ii/
 
 import Foundation
 /**
  Board will be valid if
  
  1. Each row contains digits 1-9 without repetition
  2. Each column contains digits 1-9 without repetition
  3. Each of the nine 3x3 sub-boxes contains 1-9 without repetition
  */
 class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        
        // 1. Check rows
        
        for row in board {
            
            var values: [Int: Int] = [:]
            
            for column in row {
                
                if let number = Int(String(column)) {
                    values[number, default: 0] += 1
                }
                
                if let number = Int(String(column)), let count = values[number], count > 1 {
                    return false
                }
                
                
            }
        }
        
        for column in 0..<9 {
            
            var values: [Int: Int] = [:]
            
            for row in 0..<9 {
                
                if let number = Int(String(board[row][column])) {
                    values[number, default: 0] += 1
                }
                
                if let number = Int(String(board[row][column])), let count = values[number], count > 1 {
                    return false
                }
            }
        }
        
        for i in 0..<3 {
            
            for j in 0..<3 {
                
                var values: [Int: Int] = [:]
                
                for row in 0..<3 {
                    for column in 0..<3 {
                        
                        let val = board[3 * i + row][3 * j + column]
                        
                        if let number = Int(String(val)) {
                            values[number, default: 0] += 1
                        }
                        
                        if let number = Int(String(val)), let count = values[number], count > 1 {
                            return false
                        }
                    }
                }
            }
        }
        
        return true
    }
 }
 
 let board: [[Character]] = [["5","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]]
 
 let board2: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                              ,["6",".",".","1","9","5",".",".","."]
                              ,[".","9","8",".",".",".",".","6","."]
                              ,["8",".",".",".","6",".",".",".","3"]
                              ,["4",".",".","8",".","3",".",".","1"]
                              ,["7",".",".",".","2",".",".",".","6"]
                              ,[".","6",".",".",".",".","2","8","."]
                              ,[".",".",".","4","1","9",".",".","5"]
                              ,[".",".",".",".","8",".",".","7","9"]]
 
 let board3: [[Character]] = [[".",".",".",".","5",".",".","1","."],
                              [".","4",".","3",".",".",".",".","."],
                              [".",".",".",".",".","3",".",".","1"],
                              ["8",".",".",".",".",".",".","2","."],
                              [".",".","2",".","7",".",".",".","."],
                              [".","1","5",".",".",".",".",".","."],
                              [".",".",".",".",".","2",".",".","."],
                              [".","2",".","9",".",".",".",".","."],
                              [".",".","4",".",".",".",".",".","."]]
 
 
 Solution().isValidSudoku(board3)

