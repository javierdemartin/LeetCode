/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

import Foundation

/**
 Time complexity: O(N)
 Space complexity: O(1)
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = Int.max
        
        for i in 0..<prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            } else if prices[i] - minPrice > maxProfit {
                maxProfit = prices[i] - minPrice
            }
        }
        
        return maxProfit
    }
}

Solution().maxProfit([7,1,5,3,6,4]) // 5
