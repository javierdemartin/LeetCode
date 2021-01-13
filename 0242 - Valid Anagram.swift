// https://leetcode.com/problems/valid-anagram/

import Foundation

/**
 - space complexity: O(N)
 - time complexity: O(3) - O(1)
 */
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        if s.count != t.count { return false }
        
        var mapper: [Character: Int] = [:]
        
        for i in t {
            mapper[i, default: 0] += 1
        }
        
        for i in s {
            if mapper[i] != nil {
                mapper[i]! -= 1
            }
        }
        
        for (_, value) in mapper {
            if value != 0 {
                return false
            }
        }
        
        return true
    }
}

Solution().isAnagram("taca", "cat")

