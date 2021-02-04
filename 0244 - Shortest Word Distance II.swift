/// https://leetcode.com/problems/shortest-word-distance-ii/

import Foundation

/**
 Keep track of the different times a word appears on a String using a dictionary which value is an array of indexes
 */
class WordDistance {
    
    /// For any given `key` store all the indexes in which the `key` appears on the given input
    var wordsD: [String: [Int]] = [:]
    
    /**
     Time complexity: O(N)
     Space complexity: O(N)
     */
    init(_ words: [String]) {
        
        for (i, w) in words.enumerated() {
            if wordsD[w] == nil {
                wordsD[w] = [i]
            } else {
                wordsD[w]!.append(i)
            }
        }
    }
    
    /**
     Time complexity: O(N^2)
     Space complexity: O(1)
     */
    func shortest(_ word1: String, _ word2: String) -> Int {
        
        let pos1 = wordsD[word1]!
        let pos2 = wordsD[word2]!
        
        var minD = Int.max
        
        for p1 in pos1 {
            for p2 in pos2 {
                minD = min(minD, abs(p1 - p2))
            }
        }
        
        return minD
    }
}

WordDistance(["practice", "makes", "perfect", "coding", "makes"]).shortest("coding", "practice")


