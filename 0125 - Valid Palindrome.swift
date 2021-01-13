// https://leetcode.com/problems/valid-palindrome/

import Foundation

class Solution {
    
    func isPalindrome(_ s: String) -> Bool {
        
        var i = 0, j = s.count - 1
        var s = Array(s)
        
        while i < j {
            
            // If left-most pointer is not an alphanumeric character skip it
            if !s[i].isLetter && !s[i].isNumber {
                i += 1
            }
            // If right-most pointer is not an alphanumeric character skip it
            else if !s[j].isLetter && !s[j].isNumber {
                j -= 1
            }
            // Both characters are a match, keep iterating
            else if String(s[i]).lowercased() == String(s[j]).lowercased() {
                i += 1; j -= 1;
            }
            // Not satisfying any of the above conditions means that this string is
            else {
                return false

            }
        }
        
        return true
    }
    
    func isPalindrome1(_ s: String) -> Bool {
        
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
a.isPalindrome("cat a e ")
//a.isPalindrome("A man, a plan, a canal: Panama")

