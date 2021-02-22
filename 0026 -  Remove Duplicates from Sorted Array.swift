// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

import Foundation

/**
Rather than looking for elements that are equal look for the point where they differ.

Use two pointers
- `i` will traverse the array in a normal way, fast runner
- `counter` will take into account the number of non-duplicates, slow runner

As the fast runner advances compare its value against the slow runner. Continue while no
duplicate is found. When the duplicate run ends increment the slow pointer, `counter` to
skip the duplicate and copy its value.

Time complexity: O(N)
Space complexity: O(1)
*/
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        if nums.isEmpty { return 0 }
        
        var count = 0
        
        for i in 1..<nums.count {
            
            if nums[i] != nums[count] {
                count += 1
                nums[count] = nums[i]
            }
        }
        
        return count + 1
    }
}
