// https://leetcode.com/problems/first-unique-character-in-a-string/

import Foundation


class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        // Count the number of appearances of each character
        var mapper: [Character: Int] = [:]
        
        // Build the Hash map
        for (position, char) in s.enumerated() {
            mapper[char, default: 0] += 1
        }
        
        // Iterate through the string and earch the Hashmap to check
        // if each character is unique or not
        // If the character is unique return its index
        for (position, char) in s.enumerated() {
            // Check if the current character is unique
            // If it is return the index of the string
            if let count = mapper[char], count == 1 {
                print(position, char)
                // Return the current string's index
                return position
            }
        }
        
        return -1
    }
}

//Solution().firstUniqChar("cc")
Solution().firstUniqChar("loveleetcode") // 2

