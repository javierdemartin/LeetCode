// Source: https://leetcode.com/problems/sum-of-two-integers/
// Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.



class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
    
    	var a = a
    	var b = b
    	
    	while b != 0 {
    		(a,b) = (a ^ b, (a & b) << 1)
    	}
    
        return a
    }
}

let a = 1
let b = -5

let solution = Solution()
print(solution.getSum(a,b))