// https://leetcode.com/problems/find-pivot-index/

import Foundation

/**
 Compute the total sum of the array. Travel the array from left to right keeping track of the left sum
 and checking if it matches.
 
 Time complexity: O(N)
 Space complexity: O(1)
 */
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0, +)
        
        var leftSum = 0
        
        for (i,x) in nums.enumerated() {
            
            if leftSum == (total - leftSum - x) { return i }
            
            leftSum  += x
        }
        
        return -1
    }
}
