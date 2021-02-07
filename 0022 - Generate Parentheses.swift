/// https://leetcode.com/problems/generate-parentheses/

import Foundation

/**
 Backtrack approach. The resulting string will be double the length of the input `n` parameter.
 Add the parenthesis only if we know they're gonna form a valid sequence of parenthesis.
 
 Time complexity:
 Space complexity:
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var combinations: [String] = []
        
        backtrack(&combinations, "", 0, 0, n)
        
        return combinations
    }
    
    func backtrack(_ combinations: inout [String], _ current: String, _ opening: Int, _ closing: Int, _ total: Int) {
        
        /// Condition to stop the recursion loop, once the formed string has enough
        /// characters append it to the solution
        if current.count == total * 2 {
            combinations.append(current)
            return
        }
        
        /// Add an opening parenthesis if the opening count is smaller than half the size of the sequence we want
        if opening < total {
            backtrack(&combinations, current + "(", opening + 1, closing, total)
        }
        
        if closing < opening {
            backtrack(&combinations, current + ")", opening, closing + 1, total)
        }
    }
}
