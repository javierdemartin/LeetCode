// https://leetcode.com/problems/longest-valid-parentheses/

import Foundation

/**
 Approach the problem using a brute force
 */

class Solution {
    
    // MARK: - Using a stack
    
    /**
     Use a stack while scanning the given string to check if it's so far valid.
     
     time complexity: O(n)
     space complexity: O(n)
     */
    func longestValidParentheses(_ s: String) -> Int {
        
        if s.isEmpty { return 0 }
        
        var maxLength = 0
        
        var stack: [Int] = [-1]
        
        for (index, value) in s.enumerated() {
            // Push every ")" found onto the stack
            if value == "(" {
                stack.append(index)
            } else {
                // For every ")" encountered, pop the topmost element
                stack.removeLast()
                if stack.isEmpty {
                    print("String no longer valid")
                    /// If while popping the element the stack becomes empty, push the current element's index onto the stack
                    stack.append(index)
                } else {
                    // Keep on calculating th elengths of the valid substrings
                    // Substract the current element's
                    maxLength = max(maxLength, index - stack.last!)
                }
            }
        }
        
        return maxLength
    }
    
    // MARK: - Brute force solution
    
    /**
     time complexity: O(n^3)
     space complexity: O(n)
     */
    
    /**
     Every time we encounter a "(" it's pushed onto thestack.
     For every ")" encountered pop a "(" from the stack.
     If "(" isn't available on the stack or if it contains another element the string is not valid
     */
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        
        for i in s {
            
            if i == "(" {
                stack.append(i)
            } else if !stack.isEmpty && stack[0] == "(" {
                stack.popLast()
            } else { return false }
         
        }
        
        return stack.isEmpty
    }
    
    /**
     Iterate through every possible substring
     */
    func longestValidParentheses2(_ s: String) -> Int {
        
        if s.isEmpty { return 0 }
        
        var maxLen = 0
        
        for i in 0..<s.count {
            for j in stride(from: i+2, through: s.count, by: 2) {
                let stringo = String(Array(s)[i..<j])
                
                if !isValid(stringo) { continue }
                
                maxLen = max(stringo.count, maxLen)
            }
        }
        
        return maxLen
    }
}

Solution().longestValidParentheses("())((())") // 4
//Solution().longestValidParentheses("((())") // 4
//Solution().longestValidParentheses("(()") // 2
//Solution().longestValidParentheses(")()())") // 4
//Solution().longestValidParentheses("") // 0
//Solution().longestValidParentheses("()))((()(())))(()((())))(()()))))(()()())(())()(()()()(())()()()))((()))))(())()(((()()()))))()())()()()()))()())()((())(())(()))((()))(())((()(()()))()()(()(()(()))())))(())()((((())((((((()()()((") // 56

