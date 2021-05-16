/// https://leetcode.com/problems/rearrange-spaces-between-words/

import Foundation

class Solution {
    func reorderSpaces(_ text: String) -> String {
        
        // Count the number of spaces
        var nSpaces = text.filter({ $0 == " "}).count
        
        if nSpaces == 0 {
            return text
        }
        
        let words = text.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        
        var solution = ""
        
        let count = words.count > 1 ? nSpaces / (words.count - 1) : nSpaces        
        
        for word in words {
            solution += "\(word)"
              
            if count > nSpaces {
                solution += "\(String(repeating: " ", count: nSpaces))"
                nSpaces -= nSpaces                    
            } else {
                solution += "\(String(repeating: " ", count: count))"
                nSpaces -= count                    
            }
        }
        
        solution += "\(String(repeating: " ", count: nSpaces))"
        
        return solution
    }
}
