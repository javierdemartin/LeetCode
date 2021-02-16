// https://leetcode.com/problems/fibonacci-number/

import Foundation

/**
 Slowest possible way to solve this problem using recursion as it needs exponential time.
 Each level of recursion grows exponentially.
 
 Time complexity: O(N^2)
 Space complexity: O(N)
 */
class Solution {
    
    func fib(_ n: Int) -> Int {
        
        if n <= 1 { return 1 }
        
        return fib(n - 1) + fib(n - 2)
    }
}

/**
 Use iteration (bottom-up) paired with memoization to store previous results and improve the times
 
 Time complexity: O(N)
 Space complexity: O(N)
 */
class SolutionMemoizationIteration {
    func fib(_ n: Int) -> Int {
        
        if n <= 1 { return n }
        
        return memoize(n)
    }
    
    func memoize(_ n: Int) -> Int {
        var cache = [0:0, 1:1]
        
        for i in 2...n {
            cache[i] = cache[i-1]! + cache[i-2]!
        }
        
        dump(cache)
        
        return cache[n]!
    }
}

/**
 Use recursion (top-down) paired with memoization.
 
 Time complexity: O(N)
 Space complexity: O(N)
 */
class SolutionMemoizationRecursion {
    
    var cache = [0:0, 1:1]
    
    func fib(_ n: Int) -> Int {
        
        if n <= 1 { return n }
        
        return memoize(n)
    }
    
    func memoize(_ n: Int) -> Int {
        
        if let solution = cache[n] {
            return solution
        }
        
        cache[n] = memoize(n-1) + memoize(n-2)
        
        return memoize(n)
    }
}

let s = Solution()
s.fib(4)

