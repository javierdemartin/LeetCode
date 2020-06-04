class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
    
		var maxLen = 0,  startIdx = 0, charToPos = [Character: Int]()

		for (i,c) in s.enumerated() {


			// Already exists
			if let pos = charToPos[c] {
			startIdx = max(startIdx, pos)
			}

			charToPos[c] = i+1

			maxLen = max(maxLen, i - startIdx + 1)
		}
		
		print(charToPos)

		return maxLen
    }
}

let s = "dddvddddvf"

let solution = Solution()
print(solution.lengthOfLongestSubstring(s))