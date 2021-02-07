/// https://leetcode.com/problems/permutations/

import Foundation

class Solution {
    
    func letterCombinations(_ digits: String) -> [String] {
       
				if digits.isEmpty { return [] }
 
        let map: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        
        /// Given the `digits` pressed on the keypad translate the possible combinations to the represented characters on the keypad
        let keyPresses: [String] = digits.map { map[$0]! }
        
        /// Store the solution of the possible combinations generated, each String will have the same length as the digits pressed.
        /// If the input is of length `2` each generated combination will be of the same length.
        var combinations: [String] = []
        
        var current: String = ""
        
        backtrack(keyPresses, 0, &current, &combinations)
        
        return combinations
        
    }
    
    func backtrack(_ keyPresses: [String], _ pos: Int, _ current: inout String, _ result: inout [String]) {
        
        /// Backtrack condition to stop the recursion. Whenever the built String reaches the same length as the
        /// keys pressed on the keypad the combination of chracters is appended to the result.
        if current.count == keyPresses.count {
            result.append(current)
            return
        }
        
        /// This will iterate up to the lenght of the keys pressed.
        for chars in keyPresses[pos] {
            
            /// Append the current letter to the combination
            current.append(chars)
            /// Explore new paths
            backtrack(keyPresses, pos + 1, &current, &result)
            /// Actual backtrack, remove the current letter so new paths can be explored
            current.removeLast()
        }
        
    }
}

