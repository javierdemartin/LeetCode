// https://leetcode.com/problems/single-element-in-a-sorted-array/

import Foundation

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var result = 0
                
        for num in nums {
            result ^= num
        }
        
        return result
    }
}

Solution().singleNonDuplicate([1,1,2,2,15,3,3,4,4,8,8])

