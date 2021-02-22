// https://leetcode.com/problems/sort-array-by-parity/

import Foundation

/**
 Use linear space by reordering the array while traversing it.
 Swap elements when an even number is detected
 
 Time complexity: O(N)
 Space complexity: O(1)
 */
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        
        var A = A, c = 0
        
        for i in 0..<A.count {
            if A[i] % 2 == 0 {
                let temp = A[i]
                A[i] = A[c]
                A[c] = temp
                
                c += 1
            }
        }
        
        return A
    }
}


/**
 
 Make a copy of the array.
 
 Time complexity: O(N)
 Space complexity: O(N)
 */
class SolutionBruteForce {
    
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

