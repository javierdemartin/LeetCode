/// https://leetcode.com/problems/two-sum-less-than-k/

import Foundation

/**
 This problem is a variation of Two Sum. The main difference is that we are not searching for the exact solution, so it's not guaranteed the existence of a solution.
 */
class Solution {
    
    /**
     Two pointers. Faster than brute force by initially sorting the array.
     
     If the array is sorted the complexity is reduced as we know which items are greater than the target.
     Use two pointers to traverse the array from both ends, pruning items that stray away from the target.
     
     Time complexity: O(N log N) to sort the array. If the input array was sorted it'd be O(N)
     Space complexity: O(N log N) or O(N) depending on the sorting algorithm or if the input it's sorted
     */
    func twoSumLessThanK(_ nums: [Int], _ k: Int) -> Int {
        
        /// Sort the array to make use of two pointers when iterating
        let nums = nums.sorted()
        
        var lo = 0 /// Left-most pointer
        var hi = nums.count - 1 /// Right-most pointer
        
        var solution = -1
        
        while lo < hi {
            
            let sum = nums[lo] + nums[hi]
            print(sum)
            
            if sum < k {
                /// Store the sum that's closest to the target
                solution = max(solution, sum)
                lo += 1
            } else {
                hi -= 1
            }
        }
        
       return solution
    }
    
    /**
     Brute force. Compute all the possible values and then look for the maximum value stored.
     
     Time complexity: O(N^2)
     Space complexity: O(N)
     */
    func twoSumLessThanK2(_ nums: [Int], _ k: Int) -> Int {
        
        /// Store the sums that are less than the target `k`
        var closestSums = [Int]()
        
        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                let sum = nums[i] + nums[j]
                
                if sum < k {
                    closestSums.append(sum)
                }
                
                
            }
        }
        
        if closestSums.isEmpty { return -1 }
        
        var closestSum = Int.min
        
        /// Find the maximum value that's closest to the target `k`
        for i in closestSums {
            if closestSum < i {
                closestSum = i
            }
        }

        return closestSum
    }
}

Solution().twoSumLessThanK([34,23,1,24,75,33,54,8], 60)


