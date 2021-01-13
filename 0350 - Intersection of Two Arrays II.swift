 // https://leetcode.com/problems/intersection-of-two-arrays-ii/
 
 import Foundation
 
 /**
  First thing to notice is how to approach the problem if `nums1` is larger than `nums2`.
  If the first one is greater than the latter swap them.
  
  1. Record in a HashMap a count of the number of times each number appears in `nums1`
  2. `k` is going to record the insertion point for the result in the small array
  3. Iterate along `nums2`
  4. If the current number is present in the HashMap and the count is positive copy it to `nums1` and increment `k`
  5. Decrement the count in the HashMap for that number
  6. Return the first `k` elements of `nums1`

  - space complexity: O(min(m,n))
  - time complexity: O(n + m)
  */
 
 class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        // If 2 is greater than 1 swap them
        if nums1.count > nums2.count {
            intersect(nums2, nums1)
        }
        
        var nums1 = nums1
        
        var m = [Int: Int]()
        
        for i in nums1 {
            m[i, default: 0] += 1
        }
        
        var k = 0
        
        for j in nums2 {
            print("\(j)")
            if let count = m[j], count > 0 {
                nums1[k] = j
                k += 1
                m[j]! -= 1
            }
        }
        
        return Array(nums1[0..<k])
        
    }
 }
 
 Solution().intersect([1,2,2,1], [2,2])
// Solution().intersect([4,5,9], [9,4,9,8,4])
// Solution().intersect([9,4,9,8,4], [4,5,9])

