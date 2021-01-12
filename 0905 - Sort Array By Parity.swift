// https://leetcode.com/problems/sort-array-by-parity/submissions/

import Foundation

class Solution {
    
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var evens: [Int] = []
        var odds: [Int] = []
        
        for a in A {
            if a % 2 == 0 {
                evens.append(a)
            } else {
                odds.append(a)
            }
        }
        
        for odd in odds {
            evens.append(odd)
        }
        
        return evens
    }
}

Solution().sortArrayByParity([3,2,1,4])

