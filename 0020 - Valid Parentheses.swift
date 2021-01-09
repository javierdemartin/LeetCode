// https://leetcode.com/problems/valid-parentheses/

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        
        if s.isEmpty { return true }
        
        let closing: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        
        var stack: [Character] = []
        
        for i in s {
            
            // If we currently have a closing brace get the corresponding opening one
            // from the dictionary
            if let openingBrace = closing[i] {
                
                // Get the latest added brace to the stack as it should be the first
                // one to be closed. If empty use garbage
                let first = stack.isEmpty ? "$" : stack.removeLast()
                
                // If both don't match the sequence is not correct
                if openingBrace != first { return false }
            }
            
            // Not a closing brace, add it to the stack
            else {
                stack.append(i)
            }
        }
        
        return stack.isEmpty
    }
}

let s = Solution()
s.isValid("(())")

