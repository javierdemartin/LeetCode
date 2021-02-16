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

/**
 Time complexity: O(N)
 Space complexity: O(N)
 */
class SolutionMemoization {
    
    var cache: [Int:Int] = [:]
    
    func climbStairs(_ n: Int) -> Int {
        return helper(0, n)
    }
    
    func helper(_ i: Int, _ n: Int) -> Int {
        if i > n { return 0 }
        if i == n { return 1 }
        
        if let val = cache[i], val > 0 {
            return val
        }
        
        cache[i] = helper(i+1, n) + helper(i+2, n)
        
        return cache[i]!
    }
}

let s = Solution()
s.climbStairs(15)

