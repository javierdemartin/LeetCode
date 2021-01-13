// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

import Foundation

/**
 This problem was harder for me than it seems. I am able to understand it better if I think it in terms of
 cumulative elevation gain in the mountains. When you go on a hike you start at prices[0] you don't know
 what's the trail gonna be so you start walking and hope for the best. This is the same as start counting the
 accumulated vertical gain on prices[1]. Once you reach the next checkpoint you think, have I gone up or down?
 That's the same as `prices[i] > prices[i-1]`. If true that means you've gone upwards so you gotta
 count that gain (profit) to use it afterwards. Once you reach `prices[prices.count-1]` you can check the
 accumulated vertical gain (prices) to see what has been your trail profile. Now change trails for money and it's easier.
 
 With this approach there's no need to brute-force it and it simplifies the calculations.
 
 - time complexity: O(n), there's only one pass needed through the array
 - space complexity: O(1), not dependant on the input's size
 -
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var maxProfit = 0
        
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                maxProfit += prices[i] - prices[i - 1]
            }
        }
        
        return maxProfit
    }
}

let a = [1, 7, 2, 3, 6, 7, 6, 7]

Solution().maxProfit(a)

