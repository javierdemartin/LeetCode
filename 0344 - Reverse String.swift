// https://leetcode.com/problems/reverse-string/

import Foundation

/**
 
 Use a recursive function `helper`that takes two pointers.
 
 1. If `left >= right` the pointers have reached the middle which marks the end of the recursion
 2. Switch left/right positions
 
 Time complexity: O(N) time to perform N/2 iterations
 Space complexity: O(N) to keep the recursion stack
 */
class Solution {
    
    func reverseString(_ s: inout [Character]) {
        
        helper(0, s.count - 1, &s)
    }
    
    func helper(_ left: Int, _ right: Int, _ s: inout [Character]) {
        
        /// Condition to stop the recursion loop
        if left >= right { return }
        
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        
        helper(left + 1, right - 1, &s)
    }
}

var s = Array("hola adios")

Solution().reverseString(&s)

print(s)

