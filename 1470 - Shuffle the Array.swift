// https://leetcode.com/problems/shuffle-the-array/

import Foundation

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        
        var solution: [Int] = []
        
        for i in 0..<n {
            solution.append(nums[i])
            solution.append(nums[i + n])
        }
        
        return solution
    }
}

Solution().shuffle([2,5,1,3,4,7], 3)

