// https://leetcode.com/problems/implement-strstr/

import Foundation

class Solution {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if needle.isEmpty { return 0 }
        
        if haystack.count == needle.count { return haystack == needle ? 0 : -1 }
        
        if needle.count > haystack.count { return -1 }

        var haystack = Array(haystack)
                
        for i in 0...(haystack.count - needle.count) {
            let h = String(Array(haystack[i..<i + needle.count]))
            if h == needle { return i }
        }
        
        return -1
    }
    
    func strStr2(_ haystack: String, _ needle: String) -> Int {
        if haystack.count == needle.count {
            return haystack != needle ? -1 : 0
        } else if let index = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: index.lowerBound)
        } else {
            return needle.isEmpty ? 0 : -1
        }
    }
}

let s = Solution()

s.strStr("hello", "ll")

