/// https://leetcode.com/problems/majority-element-ii/

import Foundation

/**
 Time complexity: O(N)
 Space complexity: O(N)
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        
        var map: [Int: Int] = [:]
        
        let n = Int(nums.count / 3)
        
        for i in nums {
            map[i, default: 0] += 1
        }
        
        return Array(map.filter { $0.value > n }.keys)
    }
}
