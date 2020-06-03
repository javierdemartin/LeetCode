// Source: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/solution/
//Time complexity : O(n). Only a single pass is needed.
//Space complexity : O(1). Only two variables are used.

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
    
    	var buy = Int.max
    	var maxProfit = 0
    	
    	for i in 0..<prices.count {
    		if prices[i] < buy {
    			buy = prices[i]
    		} else if (prices[i] - buy > maxProfit) {
    			maxProfit = prices[i] - buy
    		}
    	}
		
		return maxProfit
    }
}

let prices = [7,1,5,3,6,4]
//let prices = [2,4,1]
//let prices = [7,6,4,3,1]

let solution = Solution()
print(solution.maxProfit(prices))