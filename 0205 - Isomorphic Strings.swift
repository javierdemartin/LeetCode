// https://leetcode.com/problems/isomorphic-strings/

import Foundation

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
     
        if s.count != t.count { return false }
        
        var sLookup: [Character: Character] = [:]
        var tLookup: [Character: Character] = [:]
        
        for (i,j) in zip(s,t) {
            sLookup[i] = j
            tLookup[j] = i
        }
        
        for (i,j) in zip(s,t) {
            if sLookup[i] != j || tLookup[j] != i {
                return false
            }
        }
        
        return true
    }
}

//Solution().isIsomorphic("add", "egg")
//Solution().isIsomorphic("baba", "badc")
Solution().isIsomorphic("foo", "baa")

