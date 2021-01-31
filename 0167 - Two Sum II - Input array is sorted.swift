/// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

import Foundation

/**
 Time complexity: O(N)
 Space complexity: O(N)
 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        if numbers.count < 2 { return [] }
        
        var map: [Int: Int] = [:]
        
        for i in 0..<numbers.count {
            
            if let indexExists = map[target - numbers[i]] {
                return [(indexExists+1), (i+1)]
            }
            
            map[numbers[i]] = i
        }
        
        return []
    }
}

Solution().twoSum([2,7,11,15], 9)

