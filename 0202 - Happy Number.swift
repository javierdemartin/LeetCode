// https://leetcode.com/problems/happy-number/

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        
        var m = n
        var newNumber = 0
        
        var hashes: [Int: Int] = [:]
        
        // Start an endless loop
        while true {
            
            let prov = m
            
            if let result = hashes[m] {
                // The number is on the HashTable and the result is a happy number
                if result == 1 {
                    return true
                }
                // The number is on the HashTable and result it's not a 1,
                // this means we're on an endless loop and this is not a
                // happy number
                else {
                    return false
                }
            }
            
            // Shift progressively to get each of the number's digits and add them up
            while m != 0 {
                let digit = m % 10
                newNumber += digit * digit
                m /= 10
            }

            hashes[prov] = newNumber
            
            m = newNumber
            newNumber = 0
        }
    }
}

let s = Solution()
s.isHappy(19)

