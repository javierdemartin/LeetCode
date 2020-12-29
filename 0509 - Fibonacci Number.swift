// https://leetcode.com/problems/fibonacci-number/

import Foundation

class Solution {
    func fib(_ n: Int) -> Int {
        
        if n == 0 { return 0 }
        
        var a = 0
        var b = 1
        
        for _ in 1..<n {
            let c = a + b
            a = b
            b = c
        }
        
        return b
    }
}

let s = Solution()
s.fib(4)

