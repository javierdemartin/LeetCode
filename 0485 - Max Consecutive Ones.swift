/// https://leetcode.com/problems/max-consecutive-ones/

import Foundation

/**
Time complexity: O(N)
Space complexity: O(1)
*/
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        
        var counter = 0
        var temp = 0
        
        for n in nums {

            if n == 1 {
                temp += 1
            } else if n == 0 {
                counter = max(counter, temp)
                temp = 0
            }
        }
        
        counter = max(counter, temp)
        
        return counter
    }
}
