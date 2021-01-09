// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

import Foundation

class Solution {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
     
        if nums.isEmpty { return 0 }
        
        // Slow pointer
        var i = 0
        
        // j is the fast pointer
        for j in 1..<nums.count {
            
            // Copy the non duplicated item to the i+1 position
            if nums[i] != nums[j] {
                
                i += 1
                
                
                nums[i] = nums[j]
            }
            
            // If both elements are the same increase j to skip the duplicate
        }
        
        return i + 1
    }

}

var a = [1,1,2,3,4,5]

let s = Solution()
s.removeDuplicates(&a)

