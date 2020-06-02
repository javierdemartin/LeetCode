// Source: https://leetcode.com/problems/contains-duplicate/

//Given an array of integers, find if the array contains any duplicates.
//Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
		
		if Set(nums).count < nums.count { return true}
		
		return false
    }
}

let nums = [1,1,1,3,3,4,3,2,4,2]

let solution = Solution()

print(solution.containsDuplicate(nums))