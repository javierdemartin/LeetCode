import Foundation



class Solution {
    /**
    Time complexity: O(N^3)
    Space complexity: O(1)
    */
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var count = 0
        
        for len in 1...nums.count {
            for i in 0...(nums.count - len) {

                
                let sum = nums[i..<i+len].reduce(0,+)
                
                if sum == k { count += 1 }
            }
        }
        
        return count
    }
}
