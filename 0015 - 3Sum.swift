/// https://leetcode.com/problems/3sum/

import Foundation

/**
 Take the Two Sum solution with two pointers as a starter on the reasoing for the problem.
 
 Time complexity: O(N^2)
 Space complexity: O(N)
 */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        if nums.count < 3 { return [] }
        
        var triplets: [[Int]] = []
        
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            
            /// If my current value is greater than zero break from the loop as the remaining values cannot be zero
            /// This can be done thanks to the array being sorted
            if nums[i] > 0 { break }
            
            /// Don't check on the first sample as it doesn't have any previous duplicates and skip the check if we're on the first iteration
            if i == 0 || nums[i] != nums[i-1] {
                twoSumModified(nums, i, &triplets)
            }
        }
        
        return triplets
    }
    
    /**
     This is a modification of the two sum approach with two pointers but using a pivot element `nums[i]` and analyzing the items to the right.
     Set the pointers initially to the first and last elements respectively. Calculate the sum and compare it against the target.
     - If it is smaller increase the lower pointer.
     - If it is greater increase the higher pointer.
     Thus the sum always moves towards the target and it only works if the array is sorted.
     */
    func twoSumModified(_ nums: [Int], _ i: Int, _ triplets: inout [[Int]]) {
        
        var lo = i + 1
        var hi = nums.count - 1
        
        while lo < hi {
            
            let sum = nums[i] + nums[lo] + nums[hi]
            
            if sum == 0 {
                triplets.append([nums[i], nums[lo], nums[hi]])
                
                lo += 1
                hi -= 1
                
                while lo < hi && nums[lo] == nums[lo - 1] {
                    lo += 1
                }
                
            } else if sum < 0 {
                lo += 1
            } else if sum > 0 {
                hi -= 1
            }
        }
    }
}

print(Solution().threeSum([-1,0,1,2,-1,-4]))

