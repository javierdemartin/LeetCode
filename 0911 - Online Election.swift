/// https://leetcode.com/problems/online-election/submissions/

import Foundation

/**
 Passes 85/97 cases due to timeout.
 */
class TopVotedCandidate {
    
    var whoIsLeading: [Int] = []

    init(_ persons: [Int], _ times: [Int]) {
        
        let maxtime = times.max()! + 1
        
        var votes: [Int: Int] = [:]
        
        whoIsLeading = Array(repeating: -1, count: maxtime)
        
        for (t, p) in zip(times, persons) {
            
            votes[p, default: 0] += 1
            
            let maxCurVotes = votes.values.max()!
            
            /// Get, on the actual interval `i`, the candidate who has the maximum number of votes
            /// If the dictionary contains multiple pairs that means there's a tie and the vote has to go
            /// to the candidate with the latest vote
            let curCandidatesWithMaxVotes = votes.filter({ $0.value == maxCurVotes})
            
            var whoHasTheVote = Int.max
            
            /// There is a tie
            if curCandidatesWithMaxVotes.count > 1 {
                
                /// As there is a tie
                
                for a in persons[0..<times.filter({ $0 <= t }).count].reversed() {
                    
                    if curCandidatesWithMaxVotes.keys.contains(a) {
                        
                        whoHasTheVote = a
                        break
                    }
                }
                
            }
            /// Not a tie, assign the vote to the current candidate
            else {
                
                whoHasTheVote = curCandidatesWithMaxVotes.keys.first!
            }
            
            /// Fill the timeline with the votes obtained so far
            for i in t..<maxtime {
                
                whoIsLeading[i] = whoHasTheVote
            }
        }
    }
    
    func q(_ t: Int) -> Int {
        
        if t > (whoIsLeading.count-1) {
            return whoIsLeading.last!
        }
        
        return whoIsLeading[t]
    }
}

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */

let s = TopVotedCandidate([0,1,1,0,0,1,0],[0,5,10,15,20,25,30])
s.q(3)  // 0
s.q(12) // 1
s.q(25) // 1
s.q(15) // 0
s.q(24) // 0
s.q(8)  // 1
s.q(80)  // 1



//[[[0,0,1,1,2],[0,67,69,74,87]],[4],[62],[100],[88],[70],[73],[22],[75],[29],[10]]
//
//let s = TopVotedCandidate([0,0,1,1,2],[0,67,69,74,87])
//
//s.q(4)  //0
//s.q(62) //0
//s.q(100) //1
//s.q(88) //1
//s.q(70) //0
//s.q(73)  //0
//s.q(22)  //0
//s.q(75) //1
//s.q(29) //0
//s.q(10)  //0


