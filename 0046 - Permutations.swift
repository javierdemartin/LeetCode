/// https://leetcode.com/problems/permutations/solution/

import Foundation

/**
 Backtrack with recursion approach. If the candidate for the solution turns out to not satisfy a condition the backtracking algorithm
 discards the changes and uses the previous step. This essentially is running a DFS to find the path that satisfies a condition.
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {

        var vals: [[Int]] = []

        backtrack(&vals, nums, nums.count - 1)
        
        print(vals)

        return vals
    }

    func backtrack(_ vals: inout [[Int]], _ nums: [Int], _ n: Int) {

        print("> n=\(n)")
        
        if n == 0 {
            print("> Saving \(nums)")
            vals.append(nums)
            return
        } else {

            var nums = nums

            backtrack(&vals, nums, n-1)

            for i in 0..<n {

                // Swap the numbers, apply recursion and undo the swap.
                // This would be like exploring down paths on a tree, you first send a new
                // probe to explore a path and then you undo it when it finishes to their original order
                nums.swapAt(i, n)
                backtrack(&vals, nums, n-1)
                nums.swapAt(i, n)
            }
        }
    }
}

Solution().permute([1,2,3])

