// https://leetcode.com/problems/sum-of-two-integers/

import Foundation

/**
 Essentially, `a ^ b` adds binary numbers without considering the carry bit.
 
 - Use an iterative approach by treating the first component as the sum and the second component the carrying value until it's zero.
 
 0010  (2)
 0011  (3)
 0001  (^)
 
 - Generate the carry bit
 
 0010  (2)
 0011  (3)
 0010  (&)
 
 - This is the intermediate carry, shift it to the left so it's the actual value.
 
 0010
 1  left shift
 0100 - Intermediate carry
 
 Iterate again with a and b until b is zero (meaning there is no carry value)
 
 `a & b` finds which bits need to be carried and shift to the left  so the carried bit is in the right poosition.
 Recursively call `getSum` to add the previous `a ^ b` with the carry that needs to be accounted for to complete the addition.
 */
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        return (b == 0) ? a : getSum(a ^ b, (a & b) << 1)
    }
}

let s = Solution()
s.getSum(1, 2)

