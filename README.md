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

* Calculate the Nth root of a given number using [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)

```swift
func root(x: Double, n: Double) -> Double {
    
    /// Maximum error we're allow to have
    let deltaError = 0.001
    
    // Make a random guess on the solution
    var guess = x / 2
    
    var actualError = Double(Int.max)
    
    /// Solution
    var approximation = 0.0
    
    while (actualError > deltaError) {
        
        approximation = ((n - 1) * guess + x / pow(guess, n - 1)) / n
        
        actualError = abs(approximation - guess)
        guess = approximation
    }
    
    return approximation
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

**Find power of two**

```swift
/**
 A power of to will have 1s followed by some zeros. It won't be a power of two if it has more than 1-bits
 
 n = 16 --> 0 0 1 0 0 0 0
 n =
 
 1 = 00000001
 2 = 00000010
 4 = 00000100
 8 = 00001000
 
 3 = 00000011
 5 = 00000101
 7 = 00000110
 9 = 00000111
 
 1. Isolate the rightmost 1-bit: `x & (-x)`. Keeps the rightmost 1-bit and set the others to 0
 2. Set to `0` the rightmost bit: `x % (x-1)`
 
 
 `-x` is the two-complement of `x`, which is the same as inverting x and adding 1.
 Hence, `x` and `-x` have just one bit in common, the rightmost 1-bit. Doing this we keep  the rightmost 1-bit and set the rest to `0`
 
 ```
      +7 = 00000111
      -7 = 11111001
 +7 & -7 = 00000001
 
      +6 = 00000110
      -6 = 11111010
 +6 & -6 = 00000010
 
     +4 = 00000100
     -4 = 11111100
+4 & -4 = 00000100
 ```
 
 time-complexity: O(1)
 space-complexity: O(1)
 */
func isPowerOfTwo(_ n: Int) -> Bool {
    if n <= 0 { return false }
    
    return (n & (-n)) == n
}
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

#### Operators

###### XOR

> [This](https://florian.github.io/xor-trick/)  post by Florian Hartmann makes a great explanation and use cases of XOR operations

XOR (`^`) outputs a `1` if both inputs are different. It's an exclusive operation, only one argument has to be `1` for the result to be `1`.

```
0011 ^ 0101 = 0110
```

* XOR and 0: `x ^ 0 = x`. If one of the two arguments to XOR is `0` the remaining argument is the result
* XOR and the same argument `x ^ x = 0`. If both arguments are the same the result is always `0`. Applying XOR to the same arguments it cancels each other out.
* Conmutativity `x ^ y = y ^ x`. Changing the order of the arguments produces the same result.
* Sequences of XOR operations. As `^` is a bitwise operator it works regardless of what kind of values there are.


```
  a ^ b ^ c ^ a ^ b  # Conmutative reorder
= a ^ a ^ b ^ b ^ c  # x ^ x = 0
= 0 ^ 0 ^ c          # x ^ 0 = 0
= c
```

--------------

**Swap to values x and y in-place.**

```
var x = 5
var y = 2

// (x, y)
x ^= y # =>                       (x ^ y, x)
y ^= x # =>  (x ^ y, y ^ x ^ y) = (x ^ y, y)
x ^= y # => (x ^ y ^ x, x)      = (y, x)

// x is now y (2)
// y is now x (5)
```
--------------

**Find a missing number**

> You are given an array A of n - 1 integers which are in the range between 1 and n. All numbers appear exactly once, except one number, which is missing. Find this missing number.

```swift
func findMissing(_ array: [Int], _ range: Int) -> Int {
    
    var result = 0
    
    for i in 1...range {
        result ^= i
    }
    
    for value in array {
        result ^=  value
    }
    
    return result
}

findMissing([1,2,3,4,6], 6) // 5
```

This operation can also be generalized to use arithmetic operators instead of XOR. This adds potential integers and then substract the ones actually appearing.

```swift
func findMissing(_ array: [Int], _ range: Int) -> Int {
    
    var result = 0
    
    for i in 1...range {
        result += i
    }
    
    for value in array {
        result -=  value
    }
    
    return result
}

findMissing([1,2,3,4,6], 6) // 5
```

--------------

**Find a duplicate number**

> You are given an array A of n + 1 integers which are in the range between 1 and n. All numbers appear exactly once, except one number, which is duplicated. Find this duplicated number.

The previous algorithm with XOR operations can be applied to this exact same question.

--------------

> You are given an array A of n - 2 integers which are in the range between 1 and n. All numbers appear exactly once, except two numbers, which are missing. Find these two missing numbers.

Again, same solution as before.

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

General strategies to traverse a tree:

* Depth First Search (DFS): Adop **depth** as the priority, so that one would start from a root and reach all the way down to a certain leaf, and then back to root to reach another branch. Can be further distinguished into three more orders depending on the relative order amongh the root, left and right nodes.
    * Preorder: `root.val + preorder(root.left) + preorder(root.right)`
    * Inorder: `inorder(root.left) + root.val + inorder(root.right)`
    * Postorder: `posorder(root.left) + postorder(root.right) + root.val`
* Breadth First Search (BFS): Scan the tree level by level. Following the order of height, from top to bottom. The nodes on higher level will be visited before the ones with lower levels. Common approach to solve this is to use a queue.

#### Binary Tree

#### Binary Search Tree (BST)

A binary tree that orders its nodes in a way that allows fast queries.

### Resources 

* [Swift Algorithm Club](https://github.com/raywenderlich/swift-algorithm-club) from Ray Wenderlich
