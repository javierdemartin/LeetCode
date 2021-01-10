// https://leetcode.com/problems/add-digits/

import Foundation

class Solution {
    func addDigits(_ num: Int) -> Int {
        
        if num == 0 { return 0 }
        
        var num = num
        var digits: Int = 0
        var sum = 0
        
        while digits != 1 {

            digits = 0
            
            // Decompose in subdigits
            while num != 0 {
                print(num)
                
                sum += num % 10
                
                num /= 10
                
                digits += 1
                
            }
            
            num = sum
            sum = 0
        }
        
        return num
    }
}

let s = Solution()
s.addDigits(38)

