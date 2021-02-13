/// https://leetcode.com/problems/diet-plan-performance/

import Foundation

/**
 Keep track of the current sum to achieve linear time complexity. If that approach is not used it can be done using
 O(N^2) by adding up each sub-array.
 
 Time complexity: O(N)
 Space complexity: O(1)
 */
class Solution {
    func dietPlanPerformance(_ calories: [Int], _ k: Int, _ lower: Int, _ upper: Int) -> Int {
        
        if calories.isEmpty { return 0 }
        
        var points = 0
        
        var preCalcSum = 0
     
        for i in 0..<calories.count {
            
            // Add the rightmost number to the running sum
            preCalcSum += calories[i]
            
            // Do not start making calculations until the window is of at least size k
            if i >= k - 1 {
                
                if preCalcSum < lower {
                    points -= 1
                }
                
                if preCalcSum > upper {
                    points += 1
                }
                
                // Remove the left-most item of the count
                preCalcSum -= calories[i - (k - 1) ]
            }
        }
        
        return points
    }
}
