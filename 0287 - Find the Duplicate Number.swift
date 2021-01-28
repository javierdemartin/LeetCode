// https://leetcode.com/problems/find-the-duplicate-number/

import Foundation

/**
 Space complexity: O(N log N)
 Time complexity: O(1)
 */

class Solution {
    
    /**
     Timple complexity: O(N)
     Space complexity: O(N)
     */
    func findDuplicate(_ nums: [Int]) -> Int {
        var seen: Set<Int> = []
        
        for i in nums {
            if seen.contains(i) {
                return i
            }
            
            seen.insert(i)
        }
        
        return -1
    }
    
    /**
     Timple complexity: O(N^2)
     Space complexity: O(N)
     */
    func findDuplicate2(_ nums: [Int]) -> Int {
        
        var nums = nums
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if nums[i] > nums[j] {
                    let temp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = temp
                }
            }
        }
        
        for i in 1..<nums.count {
            if nums[i] == nums[i-1] {
                return nums[i]
            }
            
        }
        
        return -1
    }
}

Solution().findDuplicate([2,2, 3,1,2,5])

