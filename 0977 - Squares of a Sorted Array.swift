/// https://leetcode.com/problems/squares-of-a-sorted-array/

import Foundation

/**
	Time complexity: O(N * logN)
	Space complexity: O(N)
*/
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        
        var nums = nums
        
        for i in 0..<nums.count {
            nums[i] = nums[i] * nums[i]
        }
        
        nums = nums.sorted()
        
        return nums
    }
}
