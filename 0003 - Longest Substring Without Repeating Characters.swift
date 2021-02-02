/// https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation

/**
 Space complexity: O(N)
 Time complexity: O(N)
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        /// Map each character on the input with the index of its latest appearance
        var dict: [Character: Int] = [:]
        /// Current maximum
        var currentMaxStartIndex = 0
        
        var longestSubstringCount = 0
        
        for (i,c) in s.enumerated() {
            
            /// If the character is already on the dictionary that means it's non-unique so far
            /// Update the `start` index
            if let val = dict[c], val >= currentMaxStartIndex {
                print("Char \(c) is already w value \(val)")
                currentMaxStartIndex = val + 1
            }
            /// Update or add the latest index appearance for the current character
            dict[c] = i
            /// Re-calculate the longest substring
            longestSubstringCount = max(longestSubstringCount, i - currentMaxStartIndex + 1)
        }
        
        return longestSubstringCount
    }
}

Solution().lengthOfLongestSubstring("abcabcbb")

