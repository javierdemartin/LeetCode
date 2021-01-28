// https://leetcode.com/problems/longest-consecutive-sequence/

import Foundation

/**
 Space complexity: O(N log N)
 Time complexity: O(1)
 */

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        
        if nums.isEmpty { return 0 }
        
        // Sort
        var nums = nums
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if nums[j] < nums[i] {
                    let temp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = temp
                }
            }
        }
        
        var currentStreak = 1
        var longestStreak = 1
        
        for i in 1..<(nums.count) {
            
            if nums[i] != nums[i-1] {
                if (nums[i] == nums[i-1] + 1) {
                    currentStreak += 1
                } else {
                    longestStreak = max(longestStreak, currentStreak)
                    currentStreak = 1
                }
            }
        }
        
        return max(currentStreak, longestStreak)
    }
}

Solution().longestConsecutive([0,3,7,2,5,8,4,6,0,1])
Solution().longestConsecutive([100,4,200,1,3,2])

