 // https://leetcode.com/problems/move-zeroes/
 
 import Foundation
 
 class Solution {
    
    /**
     Fastest one that does in-place substitutions by swapping the elements
     
     - time complexity: O(N)
     - space complexity: O(1)
     */
    func moveZeroes(_ nums: inout [Int]) {
        
        var latestNonZeroAt = 0
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[latestNonZeroAt] = nums[i]
                if latestNonZeroAt != i { nums[i] = 0 }
                latestNonZeroAt += 1
            }
        }
    }
    
    /**
     Suboptimal solution.
     
     - time complexity: O(N)
     - space complexity: O(N)
     */
    func moveZeroes1(_ nums: inout [Int]) {
        
        var zeros = 0
        var nonZeroes = [Int]()
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                zeros += 1
            } else {
                nonZeroes.append(nums[i])
            }
        }
        
        if zeros == nums.count { return }
        
        for i in 0..<nums.count {
            nums[i] = 0
        }
        
        for i in 0..<nonZeroes.count {
            nums[i] = nonZeroes[i]
        }
    }
 }
 
 var a = [1,1,0,3,1,0,2]
 
 Solution().moveZeroes(&a)

