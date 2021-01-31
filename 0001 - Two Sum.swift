/// https://leetcode.com/problems/two-sum/solution/

import Foundation

/**
 Solved using two approaches.
 
 1. Two pointers
 2. One pass hash table
 */

class Solution {
    
    /**
     Two pointers
     
     Time complexity: O(N^2) To find the complement to each element it's needed to loop through the rest of the array, O(N). Do this for each element, that takes O(N) too.
     Space complexity: O(1) Space is constant and not dependent on the input size
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                if nums[j] == target - nums[i] {
                    return [i, j]
                }
            }
        }
        
        return []
    }
    
    /**
     One pass hash table. When iterating insert on the hash table the elements while looking if the complimentary number already exists.
     
     Time complexity: O(N) Only one pass through the array is needed. Time to access the hash table is constant, O(N)
     Space complexity: O(N) Space required depends on the number of items stored on the hash table. Worst case scenario would be O(N)
     */
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        
        var mapNumToIndex: [Int: Int] = [:]
        
        for (index, value) in nums.enumerated() {
            
            if let complimentary = mapNumToIndex[target - value] {
                return [complimentary, index]
            }
            
            mapNumToIndex[value] = index
        }
        
        return []
    }
}


Solution().twoSum([2,7,11,15], 9)

