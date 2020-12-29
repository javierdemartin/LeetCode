https://leetcode.com/problems/implement-strstr/

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
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

