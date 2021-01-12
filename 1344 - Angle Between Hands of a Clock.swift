// https://leetcode.com/problems/angle-between-hands-of-a-clock/

import Foundation

class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        
        var hour: Double = Double(hour)
        var minutes: Double = Double(minutes)
        
        let hourIncrement: Double = 360/12
        let minIncrement: Double = 360/60
        
        let minAngle = minIncrement * minutes
        let hourAngle = (hour.truncatingRemainder(dividingBy: 12.0) + minutes / 60.0) * hourIncrement
        
        let diff = abs(hourAngle - minAngle)
        
        return min(diff, 360.0 - diff)
    }
}
