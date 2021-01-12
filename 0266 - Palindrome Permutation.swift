// https://leetcode.com/problems/palindrome-permutation/

import Foundation

class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {

        var set: Set<Character> = []
        
        for i in s {

            if set.contains(i) {
                set = set.filter({ $0 != i })
            } else {
                set.insert(i)
            }
        }
        
        return set.count <= 1
    }
}

Solution().canPermutePalindrome("abb")

