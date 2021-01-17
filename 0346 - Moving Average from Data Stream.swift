// https://leetcode.com/problems/moving-average-from-data-stream/

import Foundation


class MovingAverage {

    var size: Int
    var queue: [Int] = []
    
    /** Initialize your data structure here. */
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        
        if queue.count >= size {
            queue.removeFirst()
        }
        
        queue.append(val)
        
        var sum: Double = 0.0
        
        for value in queue {
            sum += Double(value)
        }
        
        return sum / Double(queue.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */

let s = MovingAverage(3)

s.next(1)
s.next(2)
s.next(3)
s.next(4)

