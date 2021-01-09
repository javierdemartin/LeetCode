// https://leetcode.com/problems/add-binary/

import Foundation

/**
 As we're only adding single digits binary numbers at a time this is the explanation for the / 2 and & 2.
 
 When adding combinations of `0`s or `1`s the possible outcomes are: 0, 1 & 2. To determine the carry
 bit to use and which one to add to the result:
 
 - `0 + 0 = 0`    Bit to add: `0 % 2 = 0` Carry: `0 / 2 = 0`
 - `0 + 1 = 1`    Bit to add: `1 % 2 = 0` Carry: `1 / 2 = 0`
 - `1 + 1 = 10`  Bit to add: `2 % 2 = 0` Carry: `2 / 2 = 1`
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        var a = a, b = b
        var carry = 0
        var result = ""
        
        while !a.isEmpty || !b.isEmpty || carry > 0 {
            let x = Int(a.isEmpty ? "0" : String(a.removeLast()))!
            let y = Int(b.isEmpty ? "0" : String(b.removeLast()))!
            
            let sum = x + y + carry
            
            result = String(sum % 2) + result
            
            carry = sum / 2
        }
        
        return result
    }
}

let s = Solution()
s.addBinary("11", "1")

