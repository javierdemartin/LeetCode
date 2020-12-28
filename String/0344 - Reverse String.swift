// https://leetcode.com/problems/reverse-string/

import Foundation

class Solution {
    
    func reverseString(_ s: inout [Character]) {
        
        var left = 0
        var right = s.count - 1
        
        while left <= right {
            
            let temp = s[right]
            s[right] = s[left]
            s[left] = temp
            
            left += 1
            right -= 1
        }
    }
    
    // This is actually slower but simpler to read
    func reverseString2(_ s: inout [Character]) {
        
        for i in (0..<s.count).reversed() {
            s.append(s[i])
            s.remove(at: i)
        }
    }
}

let s = Solution()
var toReverse: [Character] =  ["H","a","n","n","a","h"]
//s.reverseString(&toReverse)
s.reverseString2(&toReverse)
print(toReverse)

