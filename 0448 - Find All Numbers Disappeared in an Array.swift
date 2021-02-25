/// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/

import Foundation

/**
 Time complexity: O(N)
 Space complexity: O(N)
 */
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        if nums.isEmpty { return [] }
        
        var cache: Set<Int> = []
        
        for n in nums {
            cache.insert(n)
        }
        
        var solution: [Int] = []
        
        for i in 1...nums.count {
            if !cache.contains(i) {
                solution.append(i)
            }
        }
        
        return solution
    }
}
