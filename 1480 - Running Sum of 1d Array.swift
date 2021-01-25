// https://leetcode.com/problems/running-sum-of-1d-array/

import Foundation

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        
        var solution = [Int]()
        
        for i in 0..<nums.count {
            if i == 0 {
                solution.append(nums[i])
            } else {
                solution.append(solution[i-1] + nums[i])
            }
        }
        
        return solution
    }
}

Solution().runningSum([1,2,3,4])

