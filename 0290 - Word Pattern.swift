// https://leetcode.com/problems/word-pattern/

import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        var matchingParam: [Character: String] = [:]
        
        let pattern = Array(pattern)
        let s = s.components(separatedBy: " ")
        
        if pattern.count != s.count {
            return false
        }
        
        for i in 0..<pattern.count {
            // Word already exists in the HashTable (a -> dog)
            if let word = matchingParam[pattern[i]] {
                // If the word in the HashTable doesn't match the one
                // at the position in the array of words it's a mismatch
                if word != s[i] { return false }
                
            } else {
                // New word to be added to the HashTable
                if !matchingParam.values.contains(s[i]) {
                    matchingParam[pattern[i]] = s[i]
                }
                // Mismatch, the word doesn't match the key
                else {
                    return false
                }
            }
        }
      
        
        return true
    }
}

Solution().wordPattern("abba", "dog cata cat dog")

