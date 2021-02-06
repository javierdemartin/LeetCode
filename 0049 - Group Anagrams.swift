/// https://leetcode.com/problems/group-anagrams/solution/
/**
Use a map to store the grouped anagrams. Key is the sorted string.

Time complexity: O(N M log M)
Space complexity: O(N M)
*/
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var r: [[String]] = []
        
        /// Index is sorted word
        var map = [String: [String]]()
        
        for w in strs {
            
            let t = String(w.sorted())
            
            if map[t] == nil { map[t] = [] }
            
            map[t]!.append(w)
        }
        
        return Array(map.values)
    }
}
