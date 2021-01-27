// https://leetcode.com/problems/missing-number/

import Foundation

/**
 Classic **find something missing on an array**. The operation is done using XOR operations but they can
 be substituted using these two statements: `result += i` and `result -= i` respectively.
 */
class Solution {
    
    func missingNumber(_ nums: [Int]) -> Int {
        return findMissing(nums)
    }
    
    func findMissing(_ array: [Int]) -> Int {
        var result = 0
        
        for i in 1...array.count {
            result ^= i
        }
        
        for value in array {
            result ^= value
        }
        
        return result
    }
}

Solution().missingNumber([9,6,4,2,3,5,7,0,1])

