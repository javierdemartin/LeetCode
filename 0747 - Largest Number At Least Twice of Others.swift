/// https://leetcode.com/problems/largest-number-at-least-twice-of-others/

import Foundation

/**
 Time complexity: O(N log N)
 Space complexity: O(N) to store the sorted items
 */
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        
        if nums.isEmpty { return -1 }
        if nums.count == 1 { return 0 }
        
        let sorted = nums.sorted()
        
        let greatest = sorted[sorted.count - 1]
        let secondGreatest = sorted[sorted.count - 2]
        
        if greatest >= secondGreatest * 2 { return nums.firstIndex(of: greatest)! }
        
        return -1
    }
}
