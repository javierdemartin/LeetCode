/// https://leetcode.com/problems/merge-intervals/

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        guard intervals.count > 0 else { return [] }
        
        var intervals = intervals
        
        intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
        var result: [[Int]] = [intervals[0]]
        
        for i in 1..<intervals.count {
            if intervals[i][0] <= result[result.count - 1][1] {
                result[result.count - 1][1] = max(intervals[i][1], result[result.count - 1][1])
            } else {
                result.append(intervals[i])
            }
        }
        
        return result
        
    }
}

Solution().merge([[1,2],[4,5],[2,4]])

