### Arrays

An array is a collection of items stored in neighboring (contiguous) memory location. As they are stored together, checking through the entire collection of items is straightforward.

* [Boyer-Moore algorithm](https://en.wikipedia.org/wiki/Boyer–Moore_majority_vote_algorithm): Find the majority of a sequence using linear time and constant space.

```swift
var count = 0
var candidate: Int? = nil

for num in nums {
    if count == 0 {
        candidate = num
    }
    
    if num == candidate {
        count += 1
    } else {
        count -= 1
    }
}

return candidate!
```

* Rotate a matrix: Transpose and shift the columns

### Maths

* [Sieve of Erathostenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes): Algorithm to find all prime numbers up to any given limit.

```swift
var primes = Array(repeating: false, count: n)

for i in 2..<n {
    
    // If true the current iteration is a prime and all of its
    // multiples have been marked as primes too
    if primes[i] { continue }
    
    var element = i
    
    // Mark the multiples of the current number to not be counted in the
    // next iteration
    while element < n {
        
        primes[element] = true
        element += i
    }
}
```

### Bit Manipulation

**Two's complement** is the representation of a negative number. A positive number is represented by itself, a negative number is created by inverting all the bits in the positive representation and then adding `1`.

```
1 to -1 --> 0 001 --> 1 110 + 1 --> 1 111
5 to -5 --> 0 101 --> 1 010 + 1 --> 1 011
```

* Logical right shift is essentially dividing by two.

```
-75  10110101
+90  01011010
```

* Arithmetical right shift takes into account the bit sign.

```
-75  10110101
-38  11011010
```

#### Tricks

* **Get bit**: Get the Nth bit of a number, `NUMBER & (1 << N) != 0`
* **Set bit**: Set the Nth bit of a number, `NUMBER | (0/1 << N)`
* **Clear bit**

```
x ^ 0s = x    x & 0s = 0s    x | 0s = x
x ^ 1s = ~x   x & 1s = x     x | 1s = 1s
x ^ x  = 0s   x & x  = x     x | x  = x
```

### Hash Table

Data strucutre that allows data retrieval by a key.

```swift
IMPLEMENTATION
```
### Others

* Hamming Distance
* Pascal's triangle


### Queues & Stacks

* **Queue** processes in First-in-First-out (supermarket queue)
* **Stack** process in Last-in-First-out (dishpile)

#### Queue

Inserts (enqueue) adds the element to the end of the queue.

* `enqueue` appends a new element to the queue
* `dequeue` removes the first element

It needs an index to indicate the starting point.

```swift
struct Queue<T> {
  private var elements: [T] = []

  mutating func enqueue(_ value: T) {
    elements.append(value)
  }

  mutating func dequeue() -> T? {
    guard !elements.isEmpty else { 
      return nil
    }
    return elements.removeFirst()
  }

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
}
```

##### Circular Queue

Using a **fixed-size array** and **two pointers** to indicate the starting and ending position. Also known as a **circular buffer**.


### Trees

#### Tree

#### Binary Tree

#### Binary Search Tree (BST)

A binary tree that orders its nodes in a way that allows fast queries.

### Resources 

* [Swift Algorithm Club](https://github.com/raywenderlich/swift-algorithm-club) from Ray Wenderlich
