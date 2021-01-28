// https://leetcode.com/problems/min-stack/submissions/

import Foundation

/**
 Using stacks this operation works in O(1) time by keeping a timeline of the minimum values as they are being added to the stack.
 
 Space complexity: O(N)
 Time complexity: O(1)
 */

class MinStack {
    
    var minValue: [Int] = []
    var stack: [Int] = []

    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        
        if stack.isEmpty {
            minValue.append(x)
        } else {
            minValue.append(min(x, minValue[minValue.count - 1]))
        }
        
        stack.append(x)
    }
    
    func pop() {
        
        stack.removeLast()
        
        minValue.removeLast()
    }
    
    func top() -> Int {
        return stack.isEmpty ? -1 : stack.last!
    }
    
    func getMin() -> Int {
        return stack.isEmpty ? -1 : minValue.last!
    }
}

let obj = MinStack()
obj.push(5)

