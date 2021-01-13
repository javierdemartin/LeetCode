// https://leetcode.com/problems/plus-one/

import Foundation

/**
 - time complexity: O(N)
 - space complexity O(N+1)
 */

class Solution {
     func plusOne(_ digits: [Int]) -> [Int] {
         
         var digits = digits
         
         
        if digits[digits.count - 1] < 9 {
            digits[digits.count - 1] += 1
            
            return digits
        }
        
        var carry = true
        
        digits[digits.count - 1] = 0
        
//        digits[digits.count - 1] = 0
        
        for i in 1..<digits.count {
            
            print(digits)
            
            if carry == false { break }
            
            let n = digits[digits.count - i - 1]
            
            if n < 9 {
                digits[digits.count - i - 1] += 1
                carry = false
            } else {
                digits[digits.count - i - 1] = 0
                carry = true
            }
        }
        
        
        if carry {
            digits = [1] + digits
        }
        
         
         return digits
     }
 }
 
// Solution().plusOne([1,2,3])
// Solution().plusOne([1,9,9])
Solution().plusOne([9,9])

