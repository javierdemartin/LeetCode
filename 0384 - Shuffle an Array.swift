// https://leetcode.com/problems/shuffle-an-array/
import Foundation

/**
 Time complexity: O(N)
 Space complexity: O(N)
 */
class Solution {

    var original: [Int]
    var nums: [Int]
    
    init(_ nums: [Int]) {
        self.original = nums
        self.nums = nums
    }
    
    /**
     Resets the array to its original configuration and return it.
     */
    func reset() -> [Int] {
        nums = original
        return nums
    }
    
    /**
     Returns a random shuffling of the array.
     */
    func shuffle() -> [Int] {
        
        
        for i in 0..<nums.count {
            
            let dest = Int.random(in: 0..<nums.count)
            let temp = nums[i]
            nums[i] = nums[dest]
            nums[dest] = temp
        }
        
        return nums
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */

let solution = Solution([1,2,3])

solution.shuffle()
solution.shuffle()
solution.shuffle()
solution.reset()

