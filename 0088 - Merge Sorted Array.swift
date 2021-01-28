// https://leetcode.com/problems/merge-sorted-array/

import Foundation

/**
 Simple approach to just merge and sort the array.
 
 Time complexity: O(N^2) depending on the sorting algorithm used
 Space complexity: O(N)
 
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        for i in 0..<n {
           nums1[i + m] = nums2[i]
        }

        for i in 0..<nums1.count {
            for j in i..<nums1.count {
                if nums1[j] < nums1[i] {
                    let temp = nums1[i]
                    nums1[i] = nums1[j]
                    nums1[j] = temp
                }
            }
        }
        
    }
}

var nums1 = [1,2,3,0,0,0]

Solution().merge(&nums1, 3, [2,5,6], 3)

