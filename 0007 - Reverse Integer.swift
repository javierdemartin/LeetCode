// https://leetcode.com/problems/reverse-integer/

/**
 Reversing digits with no conditions on negative numbers or 31-bit overflow  is easy. Adding these contraints complicates the problem.
 
 How to check for overflow? y * 10 + lastDigit is the culprit of a possible overflow.
 
 - If the number is above/below the 31 bit range (Int32.max/10) it's gonna cause an overflow
 - If the number is on the thresshold AND it's >7 OR <-7 it's gonna cause an overflow as these two will add an extra bit
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        
        var x = x
        var y = 0
        
        while x != 0 {
            // Isolate last digit
            let lastDigit = x % 10
            
            // Remove last digit
            x /= 10
            
            // Check for overflow
            if y > Int32.max/10 || (y == Int32.max/10 && lastDigit > 7) { return 0 }
            if y < Int32.min/10 || (y == Int32.min/10 && lastDigit < -8) { return 0 }
            
            // Append last digit to reversed
            y = y * 10 + lastDigit
        }
        
        return y
    }
}

//Solution().reverse(123)
Solution().reverse(1534236469)

