// https://leetcode.com/problems/rotate-array/

import Foundation


class Solution {
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        
        var k = k
        
        if k > nums.count {
            k -= Int(k/nums.count) * nums.count
        }
        
        let solution = Array(nums[(nums.count - k)..<nums.count])
        
        nums = solution + Array(nums[0..<(nums.count - k)])
        
        
    }

    
    func rotate2(_ nums: inout [Int], _ k: Int) {
        
        var k = k
        
        if k > nums.count {
            k -= Int(k/nums.count) * nums.count
        }
        
        for _ in 0..<k {
            let latest = nums.popLast()!
            nums.insert(latest, at: 0)
        }
    }
}

var a = [1,2,3,4,5,6,7]

Solution().rotate(&a, 3)

