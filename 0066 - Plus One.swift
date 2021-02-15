// https://leetcode.com/problems/plus-one/

import Foundation

/**
Time complexity: O(N)
Space complexity: O(N)
*/
class Solution {
     func plusOne(_ digits: [Int]) -> [Int] {
         
         var digits = digits
         
         /// Reverse numbers in place
         for i in 0..<digits.count/2 {
             let temp = digits[i]
             digits[i] = digits[digits.count - 1 - i]
            digits[digits.count - 1 - i] = temp
         }
         
         
         var carry = 1
         var idx = 0
         
        while carry != 0 && idx < digits.count - 1 {
            
            let sum = digits[idx] + carry
            
            carry = sum / 10
            
            digits[idx] = sum % 10
                        
            idx += 1
        }
         
         /// Add the possible missing carry
        if carry != 0 && digits[idx] > 8 {
            print("YOO")
            digits[idx] = 0
            digits.append(carry)
        } else if carry != 0 {
            digits[idx] += 1
        }
         

        /// Reverse numbers in place         
         for i in 0..<digits.count/2 {
             let temp = digits[i]
             digits[i] = digits[digits.count - 1 - i]
            digits[digits.count - 1 - i] = temp
         }
         
         return digits
     }
 }
