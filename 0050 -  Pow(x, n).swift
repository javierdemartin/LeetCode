import Foundation

/**
 Fast Power Algorithm Recursive
 
 Time complexity: O(log N)
 Space complexity: O(log N)
 */
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
    
        var N = n
        var x = x
        
        if N < 0 {
            N = -N
            x = 1 / x
        }
        
        return powHelper(x, N)
    }
    
    private func powHelper(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }

        let result = powHelper(x,n/2)
        
        if n%2 != 0 {
            return result * result * x
        }
        
        return result * result
    }
}


