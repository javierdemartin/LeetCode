// https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/

import Foundation

/**
 Time complexity: O(N^2)
 Space complexity: O(1)
 */
class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        
        var board: [[Character]] = Array(repeating: Array(repeating: "_", count: 3), count: 3)
        
        for (index, move) in moves.enumerated() {
            let x = move[0], y = move[1]
            
            if index % 2 == 0 {
                board[x][y] = "X"
            } else {
                board[x][y] = "O"
            }
        }
        
        var As = 0
        var Bs = 0
        
        /// Check horizontally for a win of a/B
        for row in board {
            
            As = 0
            Bs = 0
            
            for column in row {
                if String(column) == "X" { As += 1}
                else if String(column) == "O" { Bs += 1}
            }
            
            if As == 3 { return "A"}
            else if Bs == 3 { return "B"}
        }
        
        /// Check vertically for a win of a/B
        for col in 0..<3 {
            
            As = 0
            Bs = 0
            
            for row in 0..<3 {
                if String(board[row][col]) == "X" { As += 1 }
                else if String(board[row][col]) == "O" { Bs += 1 }
            }
            
            if As == 3 { return "A"}
            else if Bs == 3 { return "B"}
        }
        
        /// Check left diagonal for a win of a/B
        As = 0
        Bs = 0
        
        for i in 0..<3 {
            
            if String(board[i][i]) == "X" { As += 1 }
            else if String(board[i][i]) == "O" { Bs += 1 }
        }
        
        if As == 3 { return "A"}
        else if Bs == 3 { return "B"}
        
        /// Check right diagonal for a win of a/B
        As = 0
        Bs = 0
        
        for i in (0..<3).reversed() {
            if String(board[i][2-i]) == "X" { As += 1 }
            else if String(board[i][2-i]) == "O" { Bs += 1 }
        }
        
        if As == 3 { return "A"}
        else if Bs == 3 { return "B"}
        
        /// If there are less than 9 moves played the result is pending
        /// If there have been exactly 9 moves played and so far no winner has been found it's a draw
        return moves.count < 9 ? "Pending" : "Draw"
        
    }
}


Solution().tictactoe([[2,2],[0,2],[1,0],[0,1],[2,0],[0,0]])
//Solution().tictactoe([[0,2],[0,1],[2,1]])
//Solution().tictactoe([[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]])
//Solution().tictactoe([[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]])
//Solution().tictactoe([[0,0],[2,0],[1,1],[2,1],[2,2]])


