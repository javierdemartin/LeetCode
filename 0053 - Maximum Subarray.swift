// https://leetcode.com/problems/maximum-subarray/

import Foundation

/**
 A first brute-force approach would be to compute every single subarray.
 1. Iterate from the start to the end
 2. Get the sliding-window for the current subarray
 3. Compute the sum
 This approach yelds a cubic solution, O(n^3), which is not feasible.
 
 Another approach is to save the sum of the previous subarray.
 1. Create a sliding window
 2. For the next n+1 size add the already computed sum
 
 As we want the **maximum subarray** there are some shortcuts to be made here.
 Calculate the sum progressively, if the current sum yields a negative number mark the
 accumulated sum as zero. This would be the same as restarting the sum with a new window.
 And as we want the **maximum** we keep on calculating the sum with the rest of the array.
 */
class Solution {
    
    /**
     This is probably going to be the solution that you will come up with. Uses sliding window to compute all the possible combinations.
     
     Time complexity: O(N^2)
     Space complexity: O(1)
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        
        if nums.count == 1 { return nums[0] }
        
        var maxSum = Int.min
        
        for len in (1...nums.count).reversed() {
            
            for i in 0...(nums.count - len) {
                
                let sub = nums[i..<i+len]
                let subSum = sub.reduce(0,+)
                // print(sub, subSum)
                
                if subSum > maxSum { maxSum = subSum }
                
                
                
            }
        }
        
        return maxSum
    }
    
    func maxSubArray2(_ nums: [Int]) -> Int {
        
        var maxSub = nums[0]
        var currSum = nums[0]
        
        for i in 1..<nums.count {
            // Negative numbers don't contribute
            // Discarding the current nums it's the same as
            // resetting the sum and starting again
            if currSum < 0 {
                currSum = 0
            }
            
            currSum += nums[i]
            
            maxSub = max(currSum, maxSub)
        }
        
        return maxSub
    }
}

//Solution().firstUniqChar("cc")
//Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
Solution().maxSubArray([1,2])
//Solution().maxSubArray([1,2,3,4,5])


