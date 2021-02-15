/// https://leetcode.com/problems/remove-element/

import Foundation

/**
Use two pointers: slow and fast. Use the fast pointer to skip unwanted elements in the final array.

Time complexity: O(N)
Space complexity: O(1)
*/
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        var counter = 0
        
        for i in 0..<nums.count {
            
            if nums[i] != val {
                nums[counter] = nums[i]
                counter += 1
            }
        }
        
        return counter
    }
}
