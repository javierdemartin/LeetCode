// https://leetcode.com/problems/two-sum/

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        if nums.count < 2 { return [] }
        
        // Store the value and the index that number is found
        var numToIndexTable: [Int: Int] = [:]
        
        for (index, value) in nums.enumerated() {
            
            // If the complimentary number to the one we're currently iterating
            // is present get the index and return the current and the found one
            if let complimentaryIndex = numToIndexTable[target - value] {
                return [index, complimentaryIndex]
            }
            
            numToIndexTable[value] = index
        }
        
        return []
    }
}


Solution().twoSum([3,2,4], 6)

