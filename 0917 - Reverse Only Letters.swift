// https://leetcode.com/problems/reverse-only-letters/

import Foundation
/**
 1. Write the characters of `S`  one by one.
 2. If a letter is encountered write the next letter that occurs if we iterated the string backwards.
 3. Keep track of a pointer `j` that iterates through the string backwards.
 4. Use the pointer `j` whenever we need to append a letter
 
 S = "mv']4"    j = 4     solution = ""
 S = "mv']4"    j = 1     solution = "v"
 S = "mv']4"    j = 0     solution = "vm"
 S = "mv']4"    j = -1    solution = "vm'"
 S = "mv']4"    j = -1   solution = "vm']"
 S = "mv']4"    j = -1    solution = "vm']4"
 
 - time complexity: O(N) where N is the length of the given string
 - space complexity: O(N)
 */
class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        let S = Array(S)
        var sol: [Character] = []
        
        var j = S.count - 1
        print("\(String(sol)) j = \(j)")
        
        for v in S {
            if v.isLetter {
                while !S[j].isLetter {
                    j -= 1
                }
                
                sol.append(S[j])
                print("\(String(sol)) j = \(j)")
                j -= 1
            } else {
                sol.append(v)
                print("\(String(sol)) j = \(j)")
            }
        }
        
        return String(sol)
    }
}

//print(Solution().reverseOnlyLetters("ab-cd"))
//print(Solution().reverseOnlyLetters("Test1ng-Leet=code-Q!"))
//Solution().reverseOnlyLetters("7_28]")
Solution().reverseOnlyLetters("mv']4")

