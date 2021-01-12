// https://leetcode.com/problems/find-pivot-index/

import Foundation

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        var leftSum = [Int: Int]()
        var rightSum = [Int: Int]()
        
        
        for (index, value) in nums.enumerated() {
            
            let leftSide = Array(nums[0...index])
            let rightSide = Array(nums[index..<nums.count])
            
            // 2
            if let prevSum = leftSum[index - 1], let prevSumRight = rightSum[index - 1] {
                leftSum[index] = prevSum + value
                rightSum[index] = prevSumRight - nums[index - 1]
            } else {
                leftSum[index] = value
                rightSum[index] = sumArray(rightSide)
            }
        }
        
        dump(leftSum)
        dump(rightSum)
        
        // 3.
        for (index, _) in nums.enumerated() {

            if let left = leftSum[index], let right = rightSum[index], left == right {
                return index
            }
        }
        
        // 4.
        return -1
    }
    
    func sumArray(_ array: [Int]) -> Int {
        
        var tempSum = 0
        
        for i in array {
            
            tempSum += i
        }
        
        return tempSum
    }
}
