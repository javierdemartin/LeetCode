/// https://leetcode.com/problems/duplicate-zeros/

import Foundation

/**
Time complexity: O(N)
Space complexity: O(1)
*/
class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        
        // Count the number of zeros
        var zeros = arr.filter({ $0 == 0 }).count
        
        var i = arr.count + zeros - 1
        
        while i >= 0 {
            
            if zeros == 0 { return }
            
            let digit = arr[i-zeros]
            
            print(digit)
            
            if digit == 0 {
                if i < arr.count { arr[i] = digit }
                i -= 1
                zeros -= 1
            }
            
            if i < arr.count {
                arr[i] = digit
            }
            
            i -= 1
        }
    }
}
