// https://leetcode.com/problems/logger-rate-limiter/

import Foundation

/**
 Each **unique** message should only be printed **at most every 10 seconds**
 */

class Logger {
    
    var msgToNextIntervalMapper: [String: Int] = [:]
    
    let thresshold: Int = 10

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        
        if let nextInterval = msgToNextIntervalMapper[message] {
            if nextInterval <= timestamp {
                msgToNextIntervalMapper[message]! = timestamp + thresshold
                return true
            } else {
                return false
            }
        } else {
            
            msgToNextIntervalMapper[message] = timestamp + thresshold
            
            return true
        }
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */

let logger = Logger()

logger.shouldPrintMessage(1, "foo");  // return true, next allowed timestamp for "foo" is 1 + 10 = 11
logger.shouldPrintMessage(2, "bar");  // return true, next allowed timestamp for "bar" is 2 + 10 = 12
logger.shouldPrintMessage(3, "foo");  // 3 < 11, return false
logger.shouldPrintMessage(8, "bar");  // 8 < 12, return false
logger.shouldPrintMessage(10, "foo"); // 10 < 11, return false
logger.shouldPrintMessage(11, "foo"); // 11 >= 11, return true, next allowed timestamp for "foo" is

