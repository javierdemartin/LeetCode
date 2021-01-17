// https://leetcode.com/problems/search-in-rotated-sorted-array/

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        for (index, value) in nums.enumerated() {
            if value == target { return index }
        }
        
        return -1
    }
}

//Solution().search([4,5,6,7,0,1,2], 0)
Solution().search([4,5,6,7,0,1,2], 3)

