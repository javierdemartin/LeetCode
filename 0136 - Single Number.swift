// https://leetcode.com/problems/single-number/

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var mapNumberToAppearances: [Int:Int] = [:]
        
        for num in nums {
            
            mapNumberToAppearances[num, default: 0] += 1
        }
        
        dump(mapNumberToAppearances)
        
        for (key, value) in mapNumberToAppearances {

            if value == 1 {
                return key
            }
        }
        
        // This will never be executed, it's guaranteed that one number
        // will be the solution and only appear once
        return 0
    }
}

let s = Solution()
s.singleNumber([2,2,1])

