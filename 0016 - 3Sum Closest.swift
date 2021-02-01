/// https://leetcode.com/problems/3sum-closest/

import Foundation

/**
 Slight modification to the 3sum problem with some overhead added.
 This approach is going to use two pointers and the help of another one that will act as an anchor. Algorithm consists of moving
 the two opposite pointers starting from the anchor to the right side.
 
 Store in a variable, `diff` tha minimum difference calculated on each iteration. Initialize it to a huge value and the returned value
 will be the target value minus the minimum difference calculated on a step.
 
 Time complexity: O(N^2). Using two nested loops to traverse the array.
 Space complexity: O(N) or O(N log N) depending on the sorting algorithm
 */
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        let nums = nums.sorted()
        
        var diff = Int.max
        
        
        for i in 0..<nums.count {
            var lo = i + 1
            var hi = nums.count - 1
            
            while lo < hi {
                
                let sum = nums[i] + nums[lo] + nums[hi]
                
                /// Append sums anyway, we'll compare them later on
                if abs(target - sum) < abs(diff) {
                    diff = target - sum
                }
                
                if sum < target {
                    lo += 1
                } else {
                    hi -= 1
                }
            }
        }
        
        return target - diff
    }
}

Solution().threeSumClosest([-1,2,1,-4], 1)

