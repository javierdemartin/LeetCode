/// https://leetcode.com/problems/lfu-cache/

import Foundation

/**
 Runs well on 19/23 test cases. It's a hard one, I'm happy I got this far without a solution. I don't know if I'll correct it later on but saving it as a backup.
 */
class LFUCache {
    
    var capacity: Int
    var cache: [Int: Int]
    /// Store the number of times a key has been used
    /// the least used in case of a capacity excess is the one
    /// to evict
    var counter: [Int: Int]

    /// Gotta keep track of the ties in case of eviction
    /// Keep track of the latest used/added key to the cache
    var sequence: [Int]
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]
        self.counter = [:]
        self.sequence = []
    }
    
    func get(_ key: Int) -> Int {
        
        if let value = cache[key] {
            
            counter[key, default: 0] += 1
            
            /// Update teh squence too
            if let index = sequence.firstIndex(of: key) {
                sequence.remove(at: index)
            }
            
            sequence.insert(key, at: 0)
            
            print("[GET (\(key)) ]-----------------------")
            print("[Cache]> \(cache)")
            print("[Count]> \(counter)")
            print("[Seque]> \(sequence)")
            
            return value
        }
        
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        
        counter[key, default: 0] += 1
        
        /// Update teh squence too
        if let index = sequence.firstIndex(of: key) {
            sequence.remove(at: index)
        }

        sequence.insert(key, at: 0)
        
        cache[key] = value
        
        /// Evict the LFU
        if counter.keys.count > capacity {
            
            let minUsed = counter.values.min()!
            let minUsedTimes = counter.filter({ $0.value == minUsed })
            
            /// This is only when `minUsedTimes.count == 1`
            var keyToEvict = sequence.last!
            
            if minUsedTimes.count > 1 {
                print(sequence)
                
                keyToEvict = sequence.reversed().first { minUsedTimes.keys.contains($0) }!
            }
            
            sequence = sequence.filter({ $0 != keyToEvict})
            
            cache[keyToEvict] = nil
            counter[keyToEvict] = nil
            
            
        }
        
        print("[PUT (\(key), \(value)) ]-----------------------")
        print("[Cache]> \(cache)")
        print("[Count]> \(counter)")
        print("[Seque]> \(sequence)")
    }
}

let lfu = LFUCache(3);
lfu.put(2, 2)
lfu.put(1, 1)
lfu.get(2)    // 2
lfu.get(1)    // 1
lfu.get(2)    // 2
lfu.put(3, 3)
lfu.put(4, 4)
lfu.get(3) // -1
lfu.get(2) // 2
lfu.get(1) // 1
lfu.get(4) // 4

