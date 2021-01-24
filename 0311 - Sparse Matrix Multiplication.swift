// https://leetcode.com/problems/sparse-matrix-multiplication/

import Foundation

class Solution {
    func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        
        var AB = Array(repeating: Array(repeating: 0, count: B[0].count), count: A.count)
        
        for aRow in 0..<A.count {
            
            for aCol in 0..<A[0].count {
                
                if A[aRow][aCol] == 0 { continue }
                
                for bCol in 0..<B[0].count {
                    AB[aRow][bCol] += A[aRow][aCol] * B[aCol][bCol]
                }
                
            }
            
            
        }
        
        return AB
    }
}

Solution().multiply([[1,0,0],[-1,0,3]], [[7,0,0],[0,0,0],[0,0,1]])
Solution().multiply([[1,-5]],[[12],[-1]])
