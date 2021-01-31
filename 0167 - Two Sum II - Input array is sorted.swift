/// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

import Foundation


/**
 A change from the Two Sum (Problem 0001) is that the array is sorted and the indexes to return are 1-indexed.
 When the input array is sorted we can take that into an advantage as done in the first approach.
 */
class Solution {
    
    /**
     Why does it matter if the array is sorted?
     
     As the list is sorted if we use two pointers. One pointing the first and other pointing to the last item on the list. For a solution to possibly exist the sum of these
     two pointers has to be equal or less than the target value. If it's greater and as the items are already sorted we know that no combination of a pair of numbers is gonna
     add up to the target.
     
     The algorithm now consists of moving the pointers around the array trying to look for a solution. This is going to be done on a iterative loop where the condition to stop is when
     both pointers find themselves.
     
     - If the sum of the two pointers is equal to the target return both indexes as that is the solution.
     - If the sum of the two pointers is greater than the target decrease the right-most pointer by one.
     - If the sum of the two pointers is less than the target increase the left-most pointer by one.
     
     As a solution is guaranteed there's no need to check for a possible overflow when adding two values. We'll reach the correct solution eventually.
     
     Time complexity: O(N) Each of the elements on the array is visited at most once.
     Space complexity: O(1)
     */
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var lowPointer = 0
        var highPointer = numbers.count - 1
        
        while lowPointer < highPointer {
            
            let sum = numbers[lowPointer] + numbers[highPointer]
            
            if sum == target {
                return [lowPointer + 1, highPointer + 1]
            } else if sum < target {
                lowPointer += 1
            } else {
                highPointer -= 1
            }
        }
        
        /// Never gonna be reached as a solution is guaranteed
        return [-1,-1]
    }
    
    /**
     Exact same solution as the normal Two Sum problem. Only variation is that the indexes are 1-indexed. That only affects the returned values.
     By using this hash table approach we don't take advantage of the input array being sorted, that means the solution is not going to be as space efficient as possible.
     
     Time complexity: O(N),
     Space complexity: O(N)
     */
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        
        if numbers.count < 2 { return [] }
        
        var map: [Int: Int] = [:]
        
        for i in 0..<numbers.count {
            
            if let indexExists = map[target - numbers[i]] {
                return [(indexExists+1), (i+1)]
            }
            
            map[numbers[i]] = i
        }
        
        return []
    }
}

Solution().twoSum([2,7,11,15], 9)

