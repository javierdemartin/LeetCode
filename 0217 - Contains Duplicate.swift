// https://leetcode.com/problems/contains-duplicate/

import Foundation

/**
 - time complexity: O(n), need to read all of the values from the array
 - space complexity: O(n), worst case scenario the array does not have any duplicates and all the elements on the set are unique
 */
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var values: Set<Int> = []
        
        for i in nums {
            values.insert(i)
        }
        
        return values.count < nums.count ? true : false
    }
}

Solution().containsDuplicate([1,2,3,4,5,6,7])

