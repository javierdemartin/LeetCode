// https://leetcode.com/problems/car-pooling/

import Foundation

class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {

        var ups: [Int: Int] = [:]
        var downs: [Int: Int] = [:]
        var peopleIn = 0
        var minRange = Int.max
        var maxRange = Int.min

        for trip in trips {

            ups[trip[1], default: 0] += trip[0]
            downs[trip[2], default: 0] += trip[0]

            if minRange > trip[1] {
                minRange = trip[1]
            }

            if trip[2] > maxRange {
                maxRange = trip[2]
            }
        }

        for i in minRange...maxRange {

            if let ins = ups[i] {
                peopleIn += ins
            }

            if let outs = downs[i] {
                peopleIn -= outs
            }

            if peopleIn > capacity { return false }
        }

        return true
    }
}

Solution().carPooling([[2,1,5],[3,3,7]], 4) // false
Solution().carPooling([[5,4,7],[7,4,8],[4,1,8]], 17) // true
