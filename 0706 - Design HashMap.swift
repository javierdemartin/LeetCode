// https://leetcode.com/problems/design-hashmap/

import Foundation

/**
 
A hash table is a data structure that maps keys to values for high efficient lookup.
 
 Use an array of linked lists and a hash code function.
 
 1. Compute the key's hash code, will usually be an `Int`. Two different keys could have the same hash code, as there may be an infinite number of keys and a finite number of integers.
 2. Map the hash code to an index in the array. For example, `hash(key) % array_length`. Two different hash codes could, of course, map to the same index.
 3. At this index, there is a linked list of keys and values. Store the key and value in this index. Use a linked list to avoid collisions, you could have two different keys with the same hash code, or two ifferent hash codes that map to the same index.
 
 To retrieve the value pair by its key, repeat this process. Compute the hash code from the key, then compute the index from the hach code. Search through the linked list for the value with this key.
 
 If the number of collisions is very high, the worst case runtime is `O(N)`, where `N` is the number of keys.
 
 
 */

class MyHashMap {
    
    /// Array of linked list that will store
    var map: [ListNode?] = Array(repeating: nil, count: 16)

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        
        let indexToStore = key % map.count
        
        var found = false
        
        if map[indexToStore] != nil {
            var cur = map[indexToStore]
            
            while cur != nil && cur?.val.0 != key {
                cur = cur?.next
            }
            
            if cur != nil && cur?.val.0 == key {
                found = true
                cur?.val.1 = value
            }
        }
        
        if found == false {
            let cur = ListNode((key, value))
            let temp = map[indexToStore]
            cur.next = temp
            map[indexToStore] = cur
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        
        let indexForKey = key % map.count
        
        var head = map[indexForKey]

        while head != nil {
            if head?.val.0 == key {
                return head!.val.1
            }
            
            head = head?.next
        }
        
        
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let indexForKey = key % map.count
        
        if map[indexForKey] != nil {
            var cur = map[indexForKey]
            if cur?.val.0 == key {
                var next = cur?.next
                map[indexForKey] = next
            }
            
            while cur?.next != nil && cur?.next?.val.0 != key {
                
                cur = cur?.next
            }
            
            if cur?.next != nil && cur?.next?.val.0 == key {
                cur?.next = cur?.next?.next
            }
        }
    }
}

public class ListNode {
    public var val: (Int, Int)
    public var next: ListNode?
    public init(_ val: (Int, Int)) {
        self.val = val
        self.next = nil
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */

let hashMap = MyHashMap()


hashMap.put(46, 13)

hashMap.put(742, 66)
hashMap.put(66, 33)
hashMap.put(86, 86)
hashMap.put(25, 25)

//hashMap.remove(15)
hashMap.put(5, 5)
hashMap.put(5,4)
hashMap.get(46)
hashMap.get(66)
hashMap.get(5)
hashMap.get(25)
dump(hashMap.map)

//hashMap.remove(46)
hashMap.get(742)

