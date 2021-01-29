// https://leetcode.com/problems/sort-colors/

import Foundation

/**
 Time complexity: O(N^2)
 Space complexity: O(1)
 */
class Solution {
    func sortColors(_ nums: inout [Int]) {
        
        if nums.count < 2 { return }
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if nums[j] < nums[i] {
                    let temp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = temp
                }
            }
        }
    }
}

var colors: [Int] = [2,0,2,1,1,0]

Solution().sortColors(&colors)

