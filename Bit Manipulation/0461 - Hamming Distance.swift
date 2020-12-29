// https://leetcode.com/problems/hamming-distance/submissions/

import Foundation

/**
 To calculate the Hamming distance between two strings perform the XOR operation and count the total number of 1 in the resultant string.

 Graphically, XOR gate is a way to detect bits that are different.
 */

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {

        var hammingDistance = x ^ y
        var diffs = 0

        while hammingDistance > 0 {
            hammingDistance &= (hammingDistance - 1)
            diffs += 1
        }

        return diffs
    }

    func hammingDistance2(_ x: Int, _ y: Int) -> Int {

        var hammingDistance = x ^ y
        
        print(hammingDistance)
        var diffs = 0

        while hammingDistance > 0 {
            diffs += (hammingDistance & 1)
            hammingDistance >>= 1
        }

        return diffs
    }
}

let s = Solution()
s.hammingDistance2(1, 4) // 2
s.hammingDistance2(1577962638, 1727613287) // 16

