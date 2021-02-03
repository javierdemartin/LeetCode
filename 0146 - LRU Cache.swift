/// https://leetcode.com/problems/lru-cache/

import Foundation

/**
 Least Recently Used (LRU) cache
 
 1. When getting a value from a key return -1 if it doesn't exist
 2. Push a new value updating the value for the given key if it exists. Otherwise add the key-value pair tot the cache.
 3. If the number of keys exceeds the capacity evict the least recently used key
 */
class LRUCache {

    /// Actual cache that stores the key-value relations    
    var cache: [Int: Int] = [:]

    /// Queue to track the uses of the elements in the cache
    /// Queue to track the usage of keys, least used elements will be moved to the back
    /// and recently used ones will be inserted at index `0`
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

    Time complexity: O(Capacity)
    Space complexity: O(Capacity)
     */
    func get(_ key: Int) -> Int {
        
        if let value = cache[key] {
            
            popAndPush(&orderedCache, key: key)
            
            return value
        }
        
        return -1
    }
   
    /**
    Add/Update the `value` for a given `key` and also updating the keys usage on the queue

    Time complexity: O(Capacity)
    Space complexity: O(Capacity)
    */ 
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
    Called every time a get/put operation is performed on the cache.

    Searches for the index the current key is on the queue to move it to the first position 
    marking it as the last recently used key. Least used elements will move backwards progresivelly.
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

