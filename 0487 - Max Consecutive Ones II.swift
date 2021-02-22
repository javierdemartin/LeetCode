/// https://leetcode.com/problems/max-consecutive-ones-ii/

import Foundation

/**
Follow-up. Maintain the left, right and last seen zero.
As soon as you find a zero in the stream record the maximum length and
make the left-most index the zeroIndex + 1 and set zero index and right to curIndex
*/
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        
        var maxes = 0
        /// Add one if at least a zero is seen
        var seenZero = 0
        /// Index of left-most 1
        var prev = 0
        /// Index of right-most 1
        var curr = 0
        
        for i in 0..<nums.count {
 
            if nums[i] == 0 {
                prev = curr
                curr = 0
                seenZero = 1
            } else {
                curr += 1
            }
            
            maxes = max(maxes, curr + prev + seenZero)
            
            print(nums[...i], "> ", curr, prev, seenZero, " // max ", maxes)
        }
        
        return maxes
    }
}


