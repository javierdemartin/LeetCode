/// https://leetcode.com/problems/car-pooling/submissions/

class Solution {
    
    /**
     Runs well on 74/77 tests, problem is that it's a O(N^2) time solution and with big inputs it times out.
     
     Time complexity: O(N)
     Space complexity: O(1)
     */
    func minMeetingRooms2(_ intervals: [[Int]]) -> Int {
        
        let maxTime = intervals.compactMap { $0[1] }.max()! + 1
     
        var timeline = Array(repeating: 0, count: maxTime)
        
        for room in intervals {
            
            for i in room[0]..<room[1] {
                timeline[i] += 1
            }
        }
        
        print(timeline)
        
        return timeline.max()!
    }
}

Solution().minMeetingRooms2([[7,10],[2,4]]) // 1
Solution().minMeetingRooms2([[0,30],[5,10],[15,20]]) // 2
