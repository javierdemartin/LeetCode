/// https://leetcode.com/problems/binary-search/

import Foundation

/**
 Time complexity: O(log N)
 Space complexity: O(1)
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var left = 0, right = nums.count - 1
        var pivot = -1
        
        while left <= right {
            pivot = left + (right - left) / 2
            
            if nums[pivot] == target { return pivot }
            
            if target < nums[pivot] {
                right = pivot - 1
            } else {
                left = pivot + 1
            }
        }
        
        return -1
    }
}
