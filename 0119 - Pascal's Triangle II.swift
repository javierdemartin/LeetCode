/// https://leetcode.com/problems/pascals-triangle-ii/

import Foundation

/**
 Time complexity: O(N^2)
 Space omplexity: O(N)
 */
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        
        if rowIndex == 0 { return [1] }
        if rowIndex == 1 { return [1,1] }
        
        var previous = [1,1]
        
        for i in 2...rowIndex {
            
            var current = [1]
            
            for prevIndex in 1..<i {
                current.append(previous[prevIndex - 1] + previous[prevIndex])
            }
            
            current.append(1)
            previous = current
            
        }
        
        return previous
    }
}
