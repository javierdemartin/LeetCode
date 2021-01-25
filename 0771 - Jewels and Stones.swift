// https://leetcode.com/problems/jewels-and-stones/

import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        
        var count = 0
        
        for stone in stones {
            for j in jewels {
                if stone == j {
                    count += 1
                }
            }
        }
        
        return count
    }
}

Solution().numJewelsInStones("aA", "aAAbbbb")

