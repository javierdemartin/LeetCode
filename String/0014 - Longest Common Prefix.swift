import Foundation

// https://leetcode.com/problems/longest-common-prefix/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        guard let iterator = strs.compactMap({ $0.count }).min() else {
            return ""
        }
        
        print(iterator)
        
        var prefix = ""
        
        for i in stride(from: iterator, to: 0, by: -1) {
            
            let provisional = strs.compactMap({ String(Array($0)[..<i]) })
            
            if Set(provisional).count == 1 {
                return provisional[0]
            }
        }
        
        return prefix
    }
}

let s = Solution()
s.longestCommonPrefix(["dog","racecar","car"]) // ""
s.longestCommonPrefix(["flower","flow","flight"]) // "fl"
