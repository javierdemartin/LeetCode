class Solution {
    func romanToInt(_ s: String) -> Int {
        let translator: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        
        var romans = Array(s)
        var integer = 0
        var previousInteger = 0
        
        for character in romans {
            if let val = translator[character] {
                if val <= previousInteger {
                    integer += val
                } else {
                    integer += (val - 2 * previousInteger)
                }
                
                previousInteger = val
            }
        }
        
        return integer
    }
}
