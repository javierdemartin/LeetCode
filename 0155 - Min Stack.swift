// https://leetcode.com/problems/min-stack/

import Foundation

class MinStack {
    
    var minValue: Int {
        didSet {
            print("> new min \(minValue)")
        }
    }
    var stack: [Int]

    /** initialize your data structure here. */
    init() {
        minValue = Int.max
        stack = []
    }
    
    func push(_ x: Int) {
        minValue = min(minValue, x)
        stack.append(x)
    }
    
    func pop() {
        stack.removeLast()
        
        minValue = Int.max
        
        /// Find the possible new minimum value
        for i in stack {
            if i < minValue {
                minValue = i
                
            }
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minValue
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.getMin()
obj.pop()
obj.top()
obj.getMin()

