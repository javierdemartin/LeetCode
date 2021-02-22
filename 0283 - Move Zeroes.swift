 // https://leetcode.com/problems/move-zeroes/
 
 import Foundation
 
 /**
  Time complexity: O(N)
  Space complexity: O(1)
  */
 class Solution {
     func moveZeroes(_ nums: inout [Int]) {
         
         var c = 0
         
         for i in 0..<nums.count {
             if nums[i] != 0 {
                 
                 let temp = nums[i]
                 nums[i] = nums[c]
                 nums[c] = temp
                 
                 c+=1
                 
             }
         }
     }
 }
 
 var a = [1,1,0,3,1,0,2]
 
 Solution().moveZeroes(&a)

