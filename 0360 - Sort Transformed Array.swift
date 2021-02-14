/// https://leetcode.com/problems/sort-transformed-array/

import Foundation

/**

The straightforward solution would be of O(N log N) time complexity due to the final sort. It would calculate each value from the 
quadratic function and finally sort the array to match the solution's requirements.

The O(N) time complexity is achieved by understanding how a quadratic function works. It describes a parabola, the fact that it's
concave or convex is defined by A's sign. If a > 0 the parabola opens upwards and if a < 0 the parabola opens downwards

  a > 0       a < 0
                _
   \   /       / \
    \_/       /   \
	

*/

class Solution {
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        
        var nums = nums
        var solution: [Int] = []
        
        for i in 0..<nums.count {
            nums[i] = quadratic(a,b,c,nums[i])
        }
        
        if a < 0 {
             while !nums.isEmpty {
                
                let value = nums.first! < nums.last! ? nums.removeFirst() : nums.removeLast()
                
                solution.append(value)
            }
        } else {
            while !nums.isEmpty {
                
                let value = nums.first! > nums.last! ? nums.removeFirst() : nums.removeLast()
                
                solution.insert(value, at: 0)
            }
        }
        
        return solution
    }
    
    func quadratic(_ a: Int, _ b: Int, _ c: Int, _ x: Int) -> Int {
        return a * x * x + b * x + c
    }
}
