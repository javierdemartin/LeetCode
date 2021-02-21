/// https://leetcode.com/problems/unique-email-addresses/

import Foundation

/**
 Time complexity: O(N)
 Space complexity: O(N)
 */
class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        /// Create a local copy of the input
        var emails = emails
        
        for i in 0..<emails.count {
            /// Separate  the username from the domain name as there's no need to
            /// perform any transformation there
            var firstPart = String(emails[i].split(separator: "@")[0])
            
            /// Remove dots from the user's part
            firstPart = String(firstPart.replacingOccurrences(of: ".", with: ""))
            /// Remove any trailing characters after the first appearance of the `+` sign
            firstPart = String(firstPart.split(separator: "+")[0])
            
            var secondPart = emails[i].split(separator: "@")[1]
            
            /// Re-assemble the email
            emails[i] = firstPart + "@" + secondPart
        }
        /// Create a set to get the unique addresses
        return Set(emails).count
    }
}
