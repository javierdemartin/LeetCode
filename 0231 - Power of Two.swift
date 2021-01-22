// https://leetcode.com/problems/power-of-two/

import Foundation

class Solution {
    
    /**
     A power of to will have 1s followed by some zeros. It won't be a power of two if it has more than 1-bits
     
     n = 16 --> 0 0 1 0 0 0 0
     n =
     
     1 = 00000001
     2 = 00000010
     4 = 00000100
     8 = 00001000
     
     3 = 00000011
     5 = 00000101
     7 = 00000110
     9 = 00000111
     
     1. Isolate the rightmost 1-bit: `x & (-x)`. Keeps the rightmost 1-bit and set the others to 0
     2. Set to `0` the rightmost bit: `x % (x-1)`
     
     
     `-x` is the two-complement of `x`, which is the same as inverting x and adding 1.
     Hence, `x` and `-x` have just one bit in common, the rightmost 1-bit. Doing this we keep  the rightmost 1-bit and set the rest to `0`
     
     ```
          +7 = 00000111
          -7 = 11111001
     +7 & -7 = 00000001
     
          +6 = 00000110
          -6 = 11111010
     +6 & -6 = 00000010
     
         +4 = 00000100
         -4 = 11111100
    +4 & -4 = 00000100
     ```
     
     time-complexity: O(1)
     space-complexity: O(1)
     */
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false }
        
        return (n & (-n)) == n
    }
    
    func isPowerOfTwo2(_ n: Int) -> Bool {
        if n <= 0 { return false }
        
        return (n & (n - 1)) == 0
    }
    
    func isPowerOfTwo3(_ n: Int) -> Bool {
        
        if n == 0 { return false }
        
        var n = n
        
        while n % 2 == 0 {
            n /= 2
        }
        
        return n == 1
    }
}



Solution().isPowerOfTwo(128)

