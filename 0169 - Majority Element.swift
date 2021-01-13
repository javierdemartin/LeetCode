// https://leetcode.com/problems/majority-element/

import Foundation

class Solution {
    
    /**
     https://en.wikipedia.org/wiki/Boyer–Moore_majority_vote_algorithm
     */
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var candidate: Int? = nil
        
        for num in nums {
            if count == 0 {
                candidate = num
            }
            
            if num == candidate {
                count += 1
            } else {
                count -= 1
            }
        }
        
        return candidate!
    }
    
    /**
     Sorting approach
     
     - time complexity: O(n * log(n))
     - space complexity: O(1)
     */
    func majorityElement1(_ nums: [Int]) -> Int {
        
        var nums = nums
        
        for i in 0..<(nums.count - 1) {
            for j in (i+1)..<nums.count {
                if nums[i] > nums[j] {
                    let temp = nums[j]
                    nums[j] = nums[i]
                    nums[i] = temp
                }
                
            }
        }
        
        return nums[nums.count / 2]
    }
    
    /**
     - time complexity: O(n)
     - space complexity: O(n)
     */
    func majorityElement2(_ nums: [Int]) -> Int {
        var mapCounts: [Int: Int] = [:]
        
        for n in nums {
            mapCounts[n, default: 0] += 1
        }
        
        var maxCount = 0
        var maxElement = 0
        
        for (key, count) in mapCounts {
            if count > maxCount {
                maxCount = count
                maxElement = key
            }
        }
        
        return maxElement
    }
}

Solution().majorityElement([2,2,2,2,2,2,1])

