/// https://leetcode.com/problems/valid-mountain-array/

import Foundation

/**
One pass.

Space complexity: O(1)
Time complexity: O(N)
*/

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        
        var i = 0
        
        /// Walk up the mountain
        while (i < arr.count-1 && arr[i] < arr[i+1]) {
            i += 1
        }
        
        /// If index is at either the start or the end of the array
        /// we've reached the peak when we don't want
        if i == 0 || i == arr.count - 1 {
            return false
        }
        
        /// Walk down the mountain
        while (i < arr.count-1 && arr[i] > arr[i+1]) {
            i += 1
        }
            
        /// If final index reaches the count
        return i == arr.count-1
    }
}
