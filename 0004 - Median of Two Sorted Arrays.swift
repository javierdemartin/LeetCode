/// https://leetcode.com/problems/median-of-two-sorted-arrays/

import Foundation

/**
 There's probably a fancier and super uber cool solution around this involving maths.
 This algorithm involves creating a new array to join all the elements and then finding the mid point to
 calculate the mean.
 */
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let result = (nums1 + nums2).sorted()
        
        let index = Int(result.count/2)
        
        if result.count % 2 != 0 {
            return Double(result[index])
        } else {
            return Double(result[index - 1] + result[index]) / 2
        }
    }
}

Solution().findMedianSortedArrays([], [1])

