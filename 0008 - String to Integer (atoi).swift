// https://leetcode.com/problems/string-to-integer-atoi/

import Foundation

class Solution {
    func myAtoi(_ s: String) -> Int {
        
        if s.isEmpty { return 0 }
        
        var isNegative = 1
        
        var spaces = 0
        
        var A = Array(s)
        
        while spaces < A.count && A[spaces] == " " {
            spaces += 1
        }
        
        if spaces < (A.count - 1), A[spaces] == "-" || A[spaces] == "+" {
            if A[spaces] == "+" && A[spaces + 1] == "-" {
                return 0
            }
            
            if A[spaces] == "+" {
                spaces += 1
            }
            
            if A[spaces] == "-" {
                isNegative = -1
                spaces += 1
                
            }
            
        }
        
        A = Array(A[spaces..<A.count])
        
        if A.isEmpty { return 0 }
        
        let maxRange = Int32.max
        let minRange = Int32.min
        
        if !A[0].isNumber { return 0 }
        
        var generatedNumber = 0
        
        for i in 0..<A.count {
            
            guard let numbero = Int("\(A[i])") else { break }
            generatedNumber = generatedNumber * 10 + numbero
            
            if (generatedNumber * isNegative) > maxRange {
                return Int(maxRange)
            }
            
            if (generatedNumber * isNegative) < minRange {
                return Int(minRange)
            }
        }
        
        return generatedNumber * isNegative
    }
}

Solution().myAtoi("-91283472332")
Solution().myAtoi("words and 987")
Solution().myAtoi("         -42")
Solution().myAtoi("+-12")
Solution().myAtoi("4193 with words")
Solution().myAtoi(".1")
Solution().myAtoi("1")
Solution().myAtoi("-")
Solution().myAtoi("+1")
Solution().myAtoi("+")
Solution().myAtoi(" ")
Solution().myAtoi("20000000000000000000")
Solution().myAtoi("21474836460")

