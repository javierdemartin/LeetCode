/// https://leetcode.com/problems/car-pooling/submissions/

class Solution {
    
    /**
     Create a timeline with the overall number of people that leave the car at a time `i`.
     
     Time complexity: O(min(N, 1.001)), where `N` is the biggest drop time
     Space complexity: O(1)
     */
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        
        let maxTime = min(1001, trips.compactMap({ $0[2] }).max()! + 1)
        
        var timeline: [Int] = Array(repeating: 0, count: maxTime)
        
        for trip in trips {
            /// At time `trip[1]` add up the people that go into the car
            timeline[trip[1]] += trip[0]
            /// At time `trip[2]` substract the people that leave the car
            timeline[trip[2]] -= trip[0]
        }
        
        var currentCapacity = 0
        
        for n in timeline {
            currentCapacity += n
            
            if currentCapacity > capacity { return false }
        }
        
        return true
    }
}

//Solution().carPooling([[2,1,5],[3,3,7]], 4) // false
Solution().carPooling([[2,1,5],[3,3,7]], 5) // true

