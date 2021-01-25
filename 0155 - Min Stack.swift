// https://leetcode.com/problems/min-stack/

import Foundation

/**
 Approach is to use two stacks.
 - Normal stack will store the values added to it
 - Stack of maximums. WIll act as a timeline for all the maximums
 */
class MaxStack {
    
    /// For every item added to the stack keeps the current maximum value
    var maxStack: [Int] = []
    
    /// Stack containing the values to be tracked
    var stack: [Int] = []

    /** initialize your data structure here. */
    init() {
        
    }
    
    
    /// Adds a new element to the stack
    /// If stack's empty add the current element to the maxStack
    /// If stack's not empty add the maximum value between the new item and the latest value in the maxStack which is the maxValue
    /// - Parameter x: Parameter to add to the stack
    func push(_ x: Int) {
        stack.append(x)
        maxStack.append(maxStack.isEmpty ? x : max(maxStack.last!, x))
    }
    
    
    /// Pop the top-most element on the stack
    /// Also removing the last element on the maxStack
    /// - Returns: Latest element on the stack
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    /// Get the elemnt on top (last) without removing it
    func top() -> Int {
        return stack.last!
    }
    
    
    /// Return the max element without deleting it
    /// - Returns: Maximum element on the stack
    func peekMax() -> Int {
        return maxStack.last!
    }
    
    /// Remove the maximum element from the stack
    /// - Returns: Maximum element in the stack
    func popMax() -> Int {
        let max = maxStack.last!
        // Stores every element on the stack but the maximum
        var tmp: [Int] = []
        
        print("Stack is \(stack)")
        
        // go on the stack from right to left until a match for the max value is found
        // stack with the value will be left-as is unitl the popped element
        // build again from left to right the stack without the max elemennt
        // there's nothing else to do to the maxstack as the only thing to do is delete the last element
        
        while let lastItem = stack.popLast() {
            
            maxStack.removeLast()
            if lastItem == max {
                // Reached the removed element, break the loop
                break
            } else {
                tmp.append(lastItem)
            }
        }
        
        // Trick is to rebuild the stack again without the latest popped element
        while let lastItem = tmp.popLast() {
            self.push(lastItem)
        }
        
        return max
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */


/**
 Define the operations as normal
 
 Add an extra property
 */

let obj = MaxStack()
obj.push(5)
obj.push(3)
obj.push(2)
obj.push(5)
obj.push(-1)
obj.popMax()

