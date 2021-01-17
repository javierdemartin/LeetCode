// https://leetcode.com/problems/sqrtx/submissions/

import Foundation

/**
 Newton method to find the Nth root of a given number.
 
 https://en.wikipedia.org/wiki/Newton%27s_method
 */
class Solution {
    func mySqrt(_ x: Int) -> Int {
        
        if x == 0 { return 0 }
        
        return Int(root(x: Double(x), n: 2.0))
    }
    
    func root(x: Double, n: Double) -> Double {
        
        /// Maximum error we're allow to have
        let deltaError = 0.001
        
        // Make a random guess on the solution
        var guess = x / 2
        
        var actualError = Double(Int.max)
        
        /// Solution
        var approximation = 0.0
        
        while (actualError > deltaError) {
            
            approximation = ((n - 1) * guess + x / pow(guess, n - 1)) / n
            
            actualError = abs(approximation - guess)
            guess = approximation
        }
        
        return approximation
    }
}

Solution().mySqrt(7)

