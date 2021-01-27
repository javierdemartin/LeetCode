// https://leetcode.com/problems/search-a-2d-matrix/

import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        if matrix.count == 0 { return false }
        
        print("matrix \(matrix.count)")
        
        if matrix.count == 1 && matrix[0][0] <= target {
            for i in matrix[0] {
                if i == target { return true }
            }
            
            return false
        }
        
        // Search vertically
        for j in (0..<matrix.count).reversed() {
            
            if target >= matrix[j][0] {
                for i in matrix[j] {
                    if target == i { return true }
                }
                
                return false
            }
        }
        
        return false
    }
}

Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 11)
Solution().searchMatrix([[1]], 2)
Solution().searchMatrix([[1],[3]], 1)

