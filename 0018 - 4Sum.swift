/// https://leetcode.com/problems/4sum/

import Foundation

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        
        let nums = nums.sorted()
        
        var values: [[Int]] = []
        
        for i in 0..<nums.count {
            
            /// Continue if `i == 0` OR for the next indexes they are different values
            /// this is done to avoid duplicates and they're not gonna happen in the first iteration
            guard i == 0 || nums[i] != nums[i - 1] else { continue }
            
            for j in (i+1)..<nums.count {
                
                /// Avoid duplicates
                guard j == (i + 1) || nums[j] != nums[j - 1] else { continue }
                
                var lo = j + 1
                var hi = nums.count - 1

                /// This is the point where the sorted array is a benefit
                /// Move the pointers towards the solution based on conditions
                while lo < hi {

                    /// Calculate the sum
                    let sum = nums[i] + nums[j] + nums[lo] + nums[hi]

                    /// If the sum equals the target append the values to the solution
                    if sum == target {
                        values.append([nums[i], nums[j], nums[lo], nums[hi]])
                    }

                    /// Time to move the pointers  towards the solution and
                    /// avoiding suplicates
                    if sum < target {

                        let currStart = lo
                        
                        while nums[currStart] == nums[lo], lo < nums.count - 1 {
                            lo += 1
                        }
                    } else {
                        
                        let currEnd = hi
                        
                        while nums[currEnd] == nums[hi], hi > j {
                            hi -= 1
                        }
                    }
                }
            }
        }
        
        print(values)
        
        return values
    }
}

Solution().fourSum([1,0,-1,0,-2,2], 0)

