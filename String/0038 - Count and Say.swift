// https://leetcode.com/problems/count-and-say/

import Foundation

class Solution {
    func countAndSay(_ n: Int) -> String {
     
        var character: [Character] = ["1"]
        
        for _ in 1..<n {
            var temp: [Character] = []
            var index = 0
            
            while index < character.count {
                
                let value = character[index]
                var count = 0
                while index < character.count && value == character[index] {
                    count += 1
                    index += 1
                }
                
                temp.append(Character(String(count)))
                temp.append(value)
            }
            character = temp
        }
        
        return String(character)
    }
}

let s = Solution()
s.countAndSay(1)

