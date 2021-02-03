/// https://leetcode.com/problems/roman-to-integer/

import Foundation

/**
 Time complexity: O(1) There is a finite set of roman numerals available
 Space complexity: O(1) Only using a constant number of variables that don't grow when the input changes
 */
class Solution {
    
    private var map: [Character: Int] = ["I": 1,"V": 5,"X": 10,"L": 50,"C": 100,"D": 500,"M": 1000]
    
    func romanToInt(_ s: String) -> Int {
        
        let s = Array(s)
        
        /// Will progressively build up the solution
        var result = 0
        /// Pointer which advances to the right depending on the case found
        var i = 0
        
        while i < s.count {
            
            /// Substractive case, for example `IV`.
            if i + 1 < s.count && map[s[i]]! < map[s[i+1]]! {
                /// Add the difference between the current and the next value
                result += map[s[i+1]]! - map[s[i]]!
                /// Advance two steps
                i += 2
            }
            /// Not the substractive case
            else {
                result += map[s[i]]!
                i += 1
            }
        }
        
        return result
    }
}

Solution().romanToInt("XVII")

