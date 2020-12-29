// https://leetcode.com/problems/climbing-stairs/

import Foundation

/**
 First option would be to brute-force the solution. Calculating on each step the remaining number of steps to take until there are zero steps to be taken left.
 Easy option but it won't  scale as time complexity is O(2^n). For each step you open a path with two possibilities, doubling the time on each step.
 
 Memoization
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        if n < 3 { return n }
        
        var one = 1, two = 2
        
        for _ in 3...n {
            let third = one + two
            one = two
            two = third
        }
        
        return two
    }
}

let s = Solution()
s.climbStairs(15)

