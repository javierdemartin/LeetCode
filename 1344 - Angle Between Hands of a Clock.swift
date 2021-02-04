// https://leetcode.com/problems/angle-between-hands-of-a-clock/

import Foundation

/**
 Time complexity: O(1)
 Space complexity: O(1)
 */
class Solution {class Solution {
    
    private let minOffset = Double(360 / 60)
    private let hourOffset = Double(360 / 12)
    
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        
        var minAngle = minOffset * Double(minutes)
        var hourAngle = hourOffset * Double(hour) + hourOffset * Double(minutes) / 60

        hourAngle = hourAngle.truncatingRemainder(dividingBy: 360.0)
        
        let diff = abs(hourAngle - minAngle)
        
        return min(360 - diff, diff)
    }
}
