/// https://leetcode.com/problems/intersection-of-two-arrays/

import Foundation

class Solution {
    
    /**
     Time complexity: O(N+M)
     Space complexity: O(N+M)
     */
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var result: Set<Int> = []
        var temp: Set<Int> = Set(nums1)
        
        for i in 0..<nums2.count {
            if temp.contains(nums2[i]) {
                result.insert(nums2[i])
            }
        }
        return Array(result)
    }
    
    /**
     Use the built-in Swift Set intersection
     
     Time complexity: O(N+M)
     Space complexity: O(N+M)
     */
    func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(Set(nums2)))
    }
}
