// https://leetcode.com/problems/design-phone-directory/

import Foundation

class PhoneDirectory {
    
    var numbers = Set<Int>()
    var maxNumbers = 0

    /** Initialize your data structure here
        @param maxNumbers - The maximum numbers that can be stored in the phone directory. */
    init(_ maxNumbers: Int) {
        self.maxNumbers = maxNumbers
    }
    
    /** Provide a number which is not assigned to anyone.
        @return - Return an available number. Return -1 if none is available. */
    func get() -> Int {
        
        for i in 0..<maxNumbers {
            if !numbers.contains(i) {
                numbers.insert(i)
                return i
            }
        }
        
        return -1
    }
    
    /** Check if a number is available or not. */
    func check(_ number: Int) -> Bool {
        return !numbers.contains(number)
    }
    
    /** Recycle or release a number. */
    func release(_ number: Int) {
        numbers.remove(number)
    }
}

let directory = PhoneDirectory(3);

// It can return any available phone number. Here we assume it returns 0.
directory.get();
directory.numbers

// Assume it returns 1.
directory.get();
directory.numbers

// The number 2 is available, so return true.
directory.check(2);
directory.numbers

// It returns 2, the only number that is left.
directory.get();
directory.numbers

// The number 2 is no longer available, so return false.
directory.check(2);

// Release number 2 back to the pool.
directory.release(2);

// Number 2 is available again, return true.
directory.check(2);

