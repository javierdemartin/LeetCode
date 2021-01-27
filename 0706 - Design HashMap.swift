/// https://leetcode.com/problems/design-hashmap/

import Foundation

class LinkedList {
    var val: (Int, Int)
    var next: LinkedList? = nil
    
    init(_ val: (Int, Int)) {
        self.val = val
    }
}

/**
 
 A hash table is a data structure that maps keys to values for high efficient lookup. Video explaining how it works: https://www.youtube.com/watch?v=shs0KM3wKv8
 
 Use an array of linked lists and a hash code function.
 
 How to determine the index for a key? Use a hash function. It will take the key, generate a hash code that it then will be associated to a specific index. The hash code is not the index.
 
 The reason for this is that the array that stores the data from the hash table has a smaller size than all the available potential hash codes.
 
 Two different keys could have the same hash code. That's because we only have a limited number of hash codes. This will result in a collision.To solve this problem we will use chaining. If several keys have the same index on the array store them on a linked list. Store the key and value pair on the linked list to know which value is from which key.
 
 Steps:
 
 1. Compute the key's hash code, will usually be an `Int`. Two different keys could have the same hash code, as there may be an infinite number of keys and a finite number of integers.
 2. Map the hash code to an index in the array. For example, `hash(key) % array_length`. Two different hash codes could, of course, map to the same index.
 3. At this index, there is a linked list of keys and values. Store the key and value in this index. Use a linked list to avoid collisions, you could have two different keys with the same hash code, or two ifferent hash codes that map to the same index.
 
 To retrieve the value pair by its key, repeat this process. Compute the hash code from the key, then compute the index from the hach code. Search through the linked list for the value with this key.
 
 The complexity is dependant on the case. We'll have O(1) for a good hashtable with no collisions and O(N) for a terrible solution.
 */
class MyHashMap {
    
    var map: [LinkedList?] = Array(repeating: nil, count: 20)
    
    func put(_ key: Int, _ value: Int) {
        
        let index = key % map.count
        
        /// Tracks if a value to update has been found or if the current index is empty
        var found = false
        
        /// There's already one element
        if map[index] != nil {
            
            var current = map[index]
            
            while current != nil && current?.val.0 != key {
                current = current?.next
            }
            
            if current != nil && current?.val.0 == key {
                current?.val.1 = value
                found = true
            }
        }
        
        /// A value to update hasn't been found or the current index is `nil`
        /// so it's time to add a new element to the linked list
        /// Instead of adding the element to the end, as it would take more time on a linked list
        /// the new element is added to the beginning
        if found == false {
            let new = LinkedList((key, value))
            let temp = map[index]
            /// Append the values to the end of the newly created element
            new.next = temp
            map[index] = new
        }
    }
    
    /**
     Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key
     */
    func get(_ key: Int) -> Int {
        
        let index = key % map.count
        
        var head = map[index]
        
        while head != nil {
            
            /// If a match for the key is found return the associated value
            if head?.val.0 == key { return head!.val.1 }
            
            head = head?.next
        }
        
        /// A match hasn't been found on the current `index`
        return -1
    }
    
    /**
     Removes the mapping of the specified value key if this map contains a mapping for the key
     */
    func remove(_ key: Int) {
        
        let index = key % map.count
        
        /// If the element is `nil` on that `index`there's nothing to remove
        if map[index] != nil {
            
            var head = map[index]
            
            /// Check if the element to remove is the first on the linked list
            /// If it is a match update the value and return
            if head?.val.0 == key {
                map[index] = head?.next
                return
            }
            
            /// Iterate to see if the selected element's value is the next node
            /// If it is finish iterating, that means the element to remove is the next one
            /// to the currenyly stored in `head`
            while head?.next != nil && head?.next?.val.0 != key {
                head = head?.next
            }
            
            /// Substitute the `next` element by substituting it with the next's next element
            /// This is deletes it from the linked list
            if head?.next != nil && head?.next?.val.0 == key {
                head?.next = head?.next?.next
            }
        }
    }
}

let hashMap = MyHashMap()
hashMap.put(4, 4)
hashMap.put(24, 24)
hashMap.put(4, 5)
hashMap.put(44, 5)

hashMap.put(24, 25)
hashMap.get(4)
hashMap.get(24)
hashMap.remove(4)
hashMap.remove(24)
dump(hashMap.map)

