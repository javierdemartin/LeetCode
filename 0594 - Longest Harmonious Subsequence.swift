// https://leetcode.com/problems/longest-harmonious-subsequence/solution/

import Foundation

class Solution {
    func findLHS(_ nums: [Int]) -> Int {

        /**
         Store the number of times an element occurs, this map is only going to be filled once.
         */
        var map: [Int: Int] = [:]
        var longestSequence = 0
        
        for i in nums {
            
            map[i, default: 0] += 1
            
            // The harmonic sequence will be formed when a num+1 or num-1 are found
            if let minus = map[i - 1] {
                longestSequence = max(longestSequence, minus + map[i]!)
            }
            
            if let plus = map[i + 1] {
                longestSequence = max(longestSequence, plus + map[i]!)
            }
        }
        
        return longestSequence
    }
}

Solution().findLHS([1,3,2,2,5,2,3,7])

