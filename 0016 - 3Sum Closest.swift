/// https://leetcode.com/problems/3sum-closest/

import Foundation

/**
 Slight modification to the 3sum problem with some overhead added.
 
 Time complexity: O(N^2)
 Space complexity: O(N)
 */
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        let nums = nums.sorted()
        
        var sums = [Int]()
        
        for i in 0..<nums.count {
            twoSumMod(nums, i, target, &sums)
        }
        
        var closestDif = 999999
        var indexClosest = -1
        
        for (i,v) in sums.enumerated() {
            
            if abs(v-target) < closestDif {
                closestDif = abs(v - target)
                indexClosest = i
            }
        }
        
        return sums[indexClosest]
    }
    
    func twoSumMod(_ nums: [Int], _ i: Int, _ target: Int, _ sums: inout [Int]){
        
        var lo = i + 1
        var hi = nums.count - 1
        
        while lo < hi {
            
            let sum = nums[i] + nums[lo] + nums[hi]
            
            /// Append sums anyway, we'll compare them later on
            sums.append(sum)
            
            if sum == target {
                lo += 1
                hi -= 1
                
            } else if sum < target {
                lo += 1
            } else if sum > target {
                hi -= 1
            }
        }
    }
}

