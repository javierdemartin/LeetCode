// https://leetcode.com/problems/palindrome-number/

import Foundation

class Solution {
    
    func isPalindrome(_ x: Int) -> Bool {
        
        var y = Array("\(x)")
        
        for i in 0..<(y.count/2) {
            if y[i] != y[y.count - 1 - i] { return false }
        }
        
        return true
    }
}

let s = Solution()
s.isPalindrome(1221)

