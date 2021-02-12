/// https://leetcode.com/problems/single-number-iii/

import Foundation

/**

Linear space and time using hashmap.
 Another option could be to use a Set.

Time complexity: O(N)
Space complexity: O(N)
*/
class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        
        var mapNumToCount: [Int: Int] = [:]
        
        for n in nums {
            mapNumToCount[n, default: 0] += 1
        }
        
        var uniques = mapNumToCount.filter { $0.value == 1 }
        
        return Array(uniques.keys)
    }
}

Solution().singleNumber([1,2,1,3,2,5])
