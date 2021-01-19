// https://leetcode.com/problems/lru-cache/

import Foundation

/**
 Least Recently Used (LRU) cache
 
 1. When getting a value from a key return -1 if it doesn't exist
 2. Push a new value updating the value for the given key if it exists. Otherwise add the key-value pair tot the cache.
 3. If the number of keys exceeds the capacity evict the least recently used key
 */
class LRUCache {
    
    var cache: [Int: Int] = [:]
    /// Queue to track the uses of the elements in the cache
    var orderedCache: [Int]
    
    /// Defines the number of keys to store in the Cache
    var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        cache = [Int: Int]()
        orderedCache = []
    }
    
    /**
     Get the value from the given key.
     Update the key's cache by moving to the start the given key making it the most recently used.
     */
    func get(_ key: Int) -> Int {
        
        if let value = cache[key] {
            
            popAndPush(&orderedCache, key: key)
            
            return value
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        
        // Update the order of the used elements
        popAndPush(&orderedCache, key: key)
        
        // Add or update the value in the cache
        cache[key] = value
        
        /**
         If the cache is full evict the latest element which will be the least used one.
         */
        if orderedCache.count > capacity {
            let key = orderedCache.remove(at: orderedCache.count - 1)
            cache[key] = nil
        }
    }
    
    /**
     First element in the array is the most recently used. Once it's used via get/put it's removed from
     whichever position it's located to the start.
     */
    func popAndPush(_ array: inout [Int], key: Int) {
        
        if let index = array.firstIndex(of: key) {
            array.remove(at: index)
        }
        
        array.insert(key, at: 0)
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

let c = LRUCache(2)
c.put(1, 1)
print(c.cache)
print(c.orderedCache)
print("----------")
c.put(2, 2)
print(c.cache)
print(c.orderedCache)
print("----------")
c.get(1)
print(c.cache)
print(c.orderedCache)
print("----------")
c.put(3, 3)
print(c.cache)
print(c.orderedCache)
print("----------")
c.get(2)
print(c.cache)
print(c.orderedCache)
print("----------")
c.put(4, 4)
print(c.cache)
print(c.orderedCache)
print("----------")

