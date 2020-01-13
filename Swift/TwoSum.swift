// Javier de Martín
// 13/01/2019

import Foundation

var nums = [0,0,1,2,7,11,15]
let target = 9

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        // Stores the numbers in the input as keys
        // the indices as values
        var dict = [Int: Int]()

        for (i, num) in nums.enumerated() {

            print(num)
            print(dict)
            print("----------")

            // Substract num from the target to find the other number
            // in order for them to add up to the target
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }

            dict[num] = i
        }

        fatalError("No sum found")

    }
}


let result = Solution().twoSum(nums, target)
print(result)

