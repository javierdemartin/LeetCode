/// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        
        if digits.isEmpty || digits == "1" { return [] }
        
        let map: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        
        /// Array of Strings containing the letter combinations to assemble
        var str = [String]()
        
        /// Array of Strings containing the combinations
        var combinations = [String]()
        /// Current combinations
        var currentCombinations = ""
        
        str = digits.compactMap({ map[$0] })
        
        print(str)
        backtrack(str, 0, &currentCombinations, &combinations)
        
        return combinations
    }
    
    func backtrack(_ str: [String], _ pos: Int, _ currentCombinations: inout String, _ combinations: inout [String]) {
        
        /// No more digits to check so the current combination is done
        if currentCombinations.count == str.count {
            /// Append the value to the final solution
            combinations.append(currentCombinations)
            return
        }
        
        /// There are digits still to check
        /// Iterate over all the letters which map the next available digit
        for c in str[pos] {
            /// Append the current letter to the combination
            currentCombinations.append(c)
            /// Advance one digit to keep on building the string
            backtrack(str, pos + 1, &currentCombinations, &combinations)
            /// This is the actual backtracking
            currentCombinations.removeLast()
        }
    }
    
}

print(Solution().letterCombinations("23"))

