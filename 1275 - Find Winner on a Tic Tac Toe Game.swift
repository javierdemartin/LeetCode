// https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/

import Foundation

class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var table = Array(repeating: Array(repeating: "", count: 3), count: 3)
        var flatTable = Array(repeating: "", count: 3)
        var storedMoves: [Int: Int] = [:]
        
        for (index, move) in moves.enumerated() {
            
            if let existingMove = storedMoves[move[0]], existingMove == move[1] {
                return "Invalid"
            } else {
                storedMoves[move[0]] = move[1]
            }
            
            let player = index % 2 == 0 ? "X" : "O"
            
            table[move[0]][move[1]] += player
        }
        
        for (i, move) in table.enumerated() {
            
            var str = ""
            
            for i in move {
                if i.isEmpty {
                    str += " "
                } else {
                    str += i
                }
            }
            
            flatTable[i] = str
        }
        
        // horizontally
        for row in flatTable {
            var moves: [Character: Int] = [:]
            
            for col in row {
                moves[col, default: 0] += 1
            }
            
            
            if let a = moves["X"], a == 3 {
                return "A"
            } else if let a = moves["O"], a == 3 {
                return "B"
            }
            
            
            print(moves)
        }
        
        
        
        
        // check vertically
        for column in 0..<3 {
            
            var moves: [Character: Int] = [:]
            
            for row in 0..<3 {
                moves[Array(flatTable[row])[column], default: 0] += 1
            }
            
            if let a = moves["X"], a == 3 {
                return "A"
            } else if let a = moves["O"], a == 3 {
                return "B"
            }
            
        }
        
        
        
        var diagonals: [Character: Int] = [:]
        
        // check left diagonal
        for i in 0..<3 {
            
            diagonals[Array(flatTable[i])[i], default: 0] += 1
        }
        
        if let a = diagonals["X"], a == 3 {
            return "A"
        } else if let a = diagonals["O"], a == 3 {
            return "B"
        }
        
        
        diagonals = [:]
        
        for i in (0..<3).reversed() {
            diagonals[Array(flatTable[2-i])[i], default: 0] += 1
        }
        
        print(diagonals)
        
        if let a = diagonals["X"], a == 3 {
            return "A"
        } else if let a = diagonals["O"], a == 3 {
            return "B"
        }
        
        return moves.count == 9 ? "Draw" : "Pending" // "Draw"
    }
}


Solution().tictactoe([[2,2],[0,2],[1,0],[0,1],[2,0],[0,0]])
//Solution().tictactoe([[0,2],[0,1],[2,1]])
//Solution().tictactoe([[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]])
//Solution().tictactoe([[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]])
//Solution().tictactoe([[0,0],[2,0],[1,1],[2,1],[2,2]])

