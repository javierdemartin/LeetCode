// https://leetcode.com/problems/valid-palindrome/

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        // 1. Remove non-alphanumeric characters
        let pattern = "[^A-Za-z0-9]+"
        
        let nonAlphanumeric = s.replacingOccurrences(of: pattern, with: "", options: [.regularExpression]).lowercased()
        let arrayChars = Array(nonAlphanumeric)
        let chars = arrayChars.count

        for i in (0..<Int(chars/2)) {
            if (arrayChars[i]) !=  (arrayChars[chars - i - 1]) {
                return false
            }
        }
        
        return true
    }
}

let a = Solution()
a.isPalindrome("A man, a plan, a canal: Panama")
