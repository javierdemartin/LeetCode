 // https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        if nums.isEmpty { return [-1, -1] }
        
        var counter = 0
        var position = -1
        
        for (index, value) in nums.enumerated() {
            
            if value != target && position != -1 {
                break
            } else if value == target {
                counter += 1
                position = index
            }
        }
        
        if counter == 0 {
            return [-1, -1]
        }
        
        return [position - counter + 1, position]
    }
}

Solution().searchRange([5,7,7,8,8,10], 8)

