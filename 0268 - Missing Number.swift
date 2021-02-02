// https://leetcode.com/problems/missing-number/

import Foundation

/**
 Classic **find something missing on an array**. The operation is done using XOR operations but they can
 be substituted using these two statements: `result += i` and `result -= i` respectively.
 */
class Solution {
    
    /**
     Approach using XOR operations.
     
     Time complexity: O(N)
     Space complexity: O(1)
     */
    func missingNumber(_ nums: [Int]) -> Int {
        
        var missing: Int = 0
        
        for i in 1...nums.count {
            missing ^= i
        }
        
        for i in nums {
            missing ^= i
        }
        
        return missing
    }
    
    /**
     Approach using sums.
     
     Time complexity: O(N)
     Space complexity: O(1)
     */
    func missingNumber2(_ nums: [Int]) -> Int {
        
        var missing: Int = 0
        
        for i in 1...nums.count {
            missing += i
        }
        
        for i in nums {
            missing -= i
        }
        
        return missing
    }
}

Solution().missingNumber([9,6,4,2,3,5,7,0,1])

