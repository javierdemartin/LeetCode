/// https://leetcode.com/problems/product-of-array-except-self/

import Foundation

class Solution {
    
    /**
     Left and right product lists.
     
     Time complexity: O(N)
     Space complexity: O(1)
     */
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        
        var totalProduct = 1
        
        /// result[i] contains the products of all elements to the left
        var result = Array(repeating: 1, count: nums.count)
        
        for i in 0..<nums.count {
            
            result[i] = totalProduct
            
            totalProduct *= nums[i]
        }
        
        totalProduct = 1
        
        for i in (0..<nums.count).reversed() {
            result[i] *= totalProduct
            totalProduct *= nums[i]
            
            
        }
        
        return result
    }
}

Solution().productExceptSelf([1,2,3,4])

