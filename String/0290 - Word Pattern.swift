// https://leetcode.com/problems/word-pattern/

import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        let str = s.components(separatedBy: " ")
        var pattern = Array(pattern)
        var mappingPatternToWord = [Character: String]()
        
        if str.count != pattern.count { return false }
        
        for index in str.indices {
            
            if let existingPattern = mappingPatternToWord[pattern[index]] {
                if existingPattern != str[index] { return false }
            } else {
                // Pattern does not exist in the array
                if !mappingPatternToWord.values.contains(str[index]) {
                    mappingPatternToWord[pattern[index]] = str[index]
                } else {
                    return false
                }
            }
            
            
            print(mappingPatternToWord)
        }
        
        return true
    }
}

let s = Solution()
s.wordPattern("abba", "dog cat cat dog") // true
s.wordPattern("abba", "dog cat cat fish") // false
s.wordPattern("aaaa", "dog cat cat dog") // false
s.wordPattern("abba", "dog dog dog dog") // false

