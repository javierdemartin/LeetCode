/// https://leetcode.com/problems/3sum-smaller/

import Foundation

/**
 Time complexity: O(N^2). Using two nested loops to traverse the array.
 Space complexity: O(1)
 */
class Solution {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.count < 3 { return 0 }
        
        let nums = nums.sorted()
        
        var sums = 0
        
        for i in 0..<(nums.count - 2) {
            
            var lo = i + 1
            var hi = nums.count - 1
            
            while lo < hi {
                
                let sum = nums[i] + nums[lo] + nums[hi]
                
                if sum < target {
                    /// If the current value is a match all the ones on the right will be too
                    sums += hi - lo
                    lo += 1
                } else {
                    hi -= 1
                }
            }
        }
        
        return sums
    }
}

Solution().threeSumSmaller([-2,0,1,3], 2)

