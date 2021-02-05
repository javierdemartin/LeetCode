/// https://leetcode.com/problems/trapping-rain-water/solution/

import Foundation

/**
Dynamic programming. Find maximum height of the bars to both left and right.
Calculate the possible water to be stored on an index: min(maxRight[i], maxLeft[i]) - height[i]

Time complexity: O(N)
Space complexity: O(N)
*/

class Solution {
    func trap(_ height: [Int]) -> Int {
        
        var maxRight: [Int] = []
        var maxLeft: [Int] = []
        
        var count = 0
        
        for i in 0..<height.count {
            if i == 0 {
                maxRight.append(height[i])
            } else {
            
                if height[i] > maxRight[i - 1] {
                    maxRight.append(height[i])
                } else {
                    maxRight.append(maxRight[i-1])
                }
            }
        }
        
        var heighto = Array(height.reversed())
        
        for i in (0..<height.count) {
            
            if i == 0 {
                maxLeft.append(heighto[i])
            } else {
            
                if heighto[i] > maxLeft[i - 1] {
                    maxLeft.append(heighto[i])
                } else {
                    maxLeft.append(maxLeft[i - 1])
                }
            }
        }
        
        maxLeft = maxLeft.reversed()
        
        for i in 0..<height.count {
            count += min(maxRight[i], maxLeft[i]) - height[i]
        }
        
        return count
        
    }
}

Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]) // 12

