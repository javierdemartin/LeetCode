// https://leetcode.com/problems/search-insert-position/

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var index = 0
        
        for (index, num) in nums.enumerated() {
            
            if target <= num {
                return index
            }
        }
        
        return nums.count
    }
}

let s = Solution()
s.searchInsert([1,3,5,6], 0)

