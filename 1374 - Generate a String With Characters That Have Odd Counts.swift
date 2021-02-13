/// https://leetcode.com/problems/generate-a-string-with-characters-that-have-odd-counts/

import Foundation

class Solution {
    func generateTheString(_ n: Int) -> String {
        
        if n % 2 == 0 {
            return String(repeating: "a", count: n - 1) + String("b")
        } else {
            return String(repeating: "a", count: n)
        }
    }
}
