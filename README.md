
> All problems, resources and property is to be attributed to each source. This is nothing more than a personal resource to study and to share solutions with other individuals.


<details>
  <summary>Details</summary>
  

</details>

<details>
  <summary>Problem Outline</summary>
  
  

</details>

| Problem  | Category  | Difficulty  | Link  | 
|---|---|---|---|
| [0001 - Two Sum](https://leetcode.com/problems/two-sum/)  |  Array, Hash Table |  Easy | [Solution](https://github.com/javierdemartin/LeetCode-Swift/blob/master/0001%20-%20Two%20Sum.swift)  |
|   |   |   |   | 
|   |   |   |   | 


### Arrays

An array is a collection of items stored in neighboring (contiguous) memory location. As they are stored together, checking through the entire collection of items is straightforward.


<details>
  <summary>[Boyer-Moore algorithm](https://en.wikipedia.org/wiki/Boyer–Moore_majority_vote_algorithm): Find the majority of a sequence using linear time and constant space.</summary>
  
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
</details>

<details>
  <summary>Shift array to the left</summary>
  
```swift
func shiftArrayToTheLeft(_ array: inout [Int], _ times: Int) {
    
    let times = times & array.count
    
    for _ in 0..<times {
        for i in 0..<(array.count - 1) {
            let temp = array[i+1]
            array[i+1] = array[i]
            array[i] = temp
        }
    }
}
```  

</details>


<details>
  <summary>Shift array to the right</summary>
  
```swift
func shiftArrayToTheRight(_ array: inout [Int], _ times: Int) {
    
    for _ in 0..<times {
        
        let end = array[array.count - 1]
        
        for i in (1..<array.count).reversed() {
            array[i] = array[i - 1]
        }
        
        array[0] = end
    }
}
```

</details>

* Rotate a matrix: Transpose and shift the columns


<details>
  <summary>Multiply two matrices</summary>
  
```swift
class Solution {
    func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        
        var AB = Array(repeating: Array(repeating: 0, count: B[0].count), count: A.count)
        
        for aRow in 0..<A.count {
            
            for aCol in 0..<A[0].count {
                
                for bCol in 0..<B[0].count {
                    AB[aRow][bCol] += A[aRow][aCol] * B[aCol][bCol]
                }
                
            }
            
            
        }
        
        return AB
    }
}
```

</details>


### Maths

* [Sieve of Erathostenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes): Algorithm to find all prime numbers up to any given limit.

<details>
  <summary>Details</summary>
  
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

</details>

* Calculate the Nth root of a given number using [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)

<details>
  <summary>Details</summary>
  
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

</details>

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

<details>
  <summary>Details</summary>
  
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

</details>

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

<details>
  <summary>**Swap to values x and y in-place.**</summary>

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

</details>

--------------

**Find a missing number**

> You are given an array A of n - 1 integers which are in the range between 1 and n. All numbers appear exactly once, except one number, which is missing. Find this missing number.

<details>
  <summary>Details</summary>
  
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

</details>

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

### Linked List

<details>
  <summary>Detecting a loop using pointers</summary>
  
```swift
func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var visits: Set<UnsafeMutableRawPointer> = []
        
        var head = head
        
        while head != nil {
            
            if !visits.insert(Unmanaged.passUnretained(head!).toOpaque()).inserted {
                return head
            }
            
            head = head?.next
        }
        
        return nil
    }
```

</details>


<details>
  <summary>Detecting a loop using fast and slow nodes</summary>
  
```swift

```

</details>

<details>
  <summary>Converting a list to a looped list</summary>
  
```swift
var tail = head

/// Move the pointer to the last node of the list
while tail?.next != nil {
    tail = tail?.next
}

/// `tail` pointer is now pointing to the end of `head`
/// By pointing the last element of `head` to the start of `head`
/// A circle/infinite list is creating a loop from the last node to the first one
tail?.next = head
```

</details>

<details>
  <summary>Details</summary>
  
```swift
func reverseList(_ head: ListNode?) -> ListNode? {

    /// If `head == nil` no work to do, it's an empty linked list
    /// If `head.next == nil` we have on item, return the head.
    /// This marks the end of the downwards recursion. Base case as the single node is the reverse list
    /// One node is the reversed list as the next value is nil
    if head == nil  || head?.next == nil {
        return head
    }

    /// Reverse the ret of the list not including me, paass the next node
    /// This will not have a value until we get to tbe bottom of the list, last node
    let reverseListHead = reverseList(head?.next)

    /// Set the new head node's next node to be the previous head node which is now the end node
    /// Set my next node's next to me
    head?.next?.next = head

    /// Set the old head node's next to `nil`, making it the end node for now
    head?.next = nil

    /// Return upwards the end of the list's head by the end
    /// end recursion updwards adding each node itself to the reversed list while at the same time
    /// passing the list's head up and up the chain
    return reverseListHead
}
```

<details>
  <summary>Printing a Linked List's values in reverse</summary>
  
```swift
func recurse(_ head: inout ListNode?) {
    
    var head = head
    
    if head != nil {
        recurse(head?.next)
        print("\(head!.val)")
        head = head?.next
    }
}
```

  

</details>



### Queues & Stacks

* **Queue** processes in First-in-First-out (supermarket queue)
* **Stack** process in Last-in-First-out (dish pile)

#### Stack

Uses LIFO ordering and it uses the following operations:

* `pop()`: Remove the top item from the stack
* `push(item)`: Add an item to the top of the stack
* `peek()`: Return the top of the stack
* `isEmpty()`: Return true if and only if the stack is empty

Unlike an array, **a stack does not offer constant time-access to the ith item**. If does allow constant time adds and removes ad it doesn't require shifting elements.

**Stacks are  useful in certain recursive algorithms**. You push temporary data onto a stack as you recurse but then remove them as you **backtrack**.

Can be implemented using a linked list  if items are added and removed from the same side.

#### Queue

Uses FIFO ordering and it uses the following operations:

* `add(item)`: Add an item to the end of the queue
* `remove()`: Remove the first item in the queue
* `peek()`: Return the top of the queue
* `isEmpty`: Return true if and only if the queue is empty

Can be implemented with a linked list as long items are added and removed from opposite sides.

Inserts (enqueue) adds the element to the end of the queue.

<details>
  <summary>Implementation</summary>
  
```swift
struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        
        return elements.removeFirst()
    }
    
    var head: T? { return elements.first }
     
    var tail: T? { return elements.last }
}
```

</details>

Used in breadth-first search or implemented a cache.

##### Circular Queue

Using a **fixed-size array** and **two pointers** to indicate the starting and ending position. Also known as a **circular buffer**.


### Trees

A tree is a data structure composed of nodes.

1. Each tree has a **root node**.
2. The root node has zero or more child nodes.
3. Each child nod has zero or more child nodes.

<details>
  <summary>Implementation</summary>
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
</details>

A **binary tree** is a tree in which each node has up to two children. Not all trees are binary rees.

A **binary search tree** is a binary tree in which every node fits a specific ordering property. All left descendesnts are less than or equal to the current node, which is less than the right descendents.

```


    8           8
   / \         / \
  4  10       4  10
 / \   \     / \   \
2   6  20	2  12   20	
```

**Balanced vs unbalanced tree**. A balanced tree does not mean both left and right subtrees are exactly the same size.

**Complete binary trees**  Every level of the tree is fully filed, except for perhaphs the last level. To the extent that the last level is filled, it is filled from left to right.

<details>
  <summary>Example</summary>  
  
```swift
Not complete   Complete
Binary Tree    Binary Tree
    8            8
   / \          / \
  4  10       4    10
 / \   \     / \   /
2   6  20	2  12 15	
```

</details>

**Full binary tree**: Every note has either zero or two children. No nodes have only one child.

**Perfect binary tree**: All interior nodes have two children and all leaf nodes are at the same level.

#### Binary Tree Traversal

General strategies to traverse a tree:

* Depth First Search (DFS): Adop **depth** as the priority, so that one would start from a root and reach all the way down to a certain leaf, and then back to root to reach another branch. Can be further distinguished into three more orders depending on the relative order amongh the root, left and right nodes.
    * Preorder: `root.val + preorder(root.left) + preorder(root.right)`
    * Inorder: `inorder(root.left) + root.val + inorder(root.right)`. Visit the left branch, then the current node, and finally the right branch. 
    * Postorder: `postorder(root.left) + postorder(root.right) + root.val`
    


* Breadth First Search (BFS): Scan the tree level by level. Following the order of height, from top to bottom. The nodes on higher level will be visited before the ones with lower levels. Common approach to solve this is to use a queue.

<details>
  <summary>Breadth First Search</summary>
  
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        
        var depth = [[Int]]()
        
        recursion(&depth, 0, root)
        
        return depth.count
    }
    
    func recursion(_ depth: inout [[Int]], _ level: Int, _ l: TreeNode?) {
        
        if l == nil { return }
        
        if level == depth.count {
            depth.append([])
        }
        
        depth[level].append(l!.val)
        
        if l?.left != nil {
            recursion(&depth, level + 1, l?.left)
        }
        
        if l?.right != nil {
            recursion(&depth, level + 1, l?.right)
        }
    }
}



<details>
  <summary>In-order traversal</summary>
  
```swift
func inOrderTraversal(node: TreeNode) {
	if node != nil {
		inOrderTraversal(node.left)
		print("\(node.val)")
		inOrderTraversal(node.right)
	}
}
```
</details>

<details>
  <summary>Pre-order</summary>
  
```swift
func preOrderTraversal(node: TreeNode) {
	if node != nil {
		print("\(node.val)")
		preOrderTraversal(node.left)
		preOrderTraversal(node.right)
	}
}
```
</details>

<details>
  <summary>Post-order</summary>
  
```swift
func postOrderTraversal(node: TreeNode) {
	if node != nil {
		postOrderTraversal(node.left)
		postOrderTraversal(node.right)
		print("\(node.val)")
	}
}
```
</details>

A **min-heap** is a complete binary tree where each node is smaller than its children. The root is the minimum element in the tree.

```
     4           
   /   \      
  50    7     
 / \   /   
55 90 87
```

<details>
  <summary>Invert a binary tree</summary>
```swift
func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        if root == nil { return nil}
        
        let right = invertTree(root?.right)
        let left = invertTree(root?.left)
        root?.left = right
        root?.right = left
        
        return root
    }
```

</details>

Two key operations on a min-heap: insert and extact\_min.

### Recursion and Dynamic Programming

Recursive solutions are built off of solutions to subproblems

* **Bottom-up approach**: Know how to solve the problem for a simple case. Then figure out how to solve it for a more complex case.
* **Top-down approach**: Think about how you can divide de problem  for case N into supbproblems

#### Recursion

Recursion is an approach to solving problems using a function that calls itself as a subroutine. By doing this the problem is reduced into subproblems. Recursion continues until it reaches a point where the subproblem can be solved without further recursion.

Ending up in an infinite loop is quite common, to avoid this define the following properties:

1. A **base case** which defines a scenario that does not use recursion to produce an answer.
2. Rules that reduce the given cases towards the base case, **recurrence relation**

### Sorting and Searching

Bubble sort

Selection Sort

Merge Sort

Quick sort

Radix Sort

Binary search

### Resources 

* [Swift Algorithm Club](https://github.com/raywenderlich/swift-algorithm-club) from Ray Wenderlich
* [Cracking the Coding Interview](https://www.goodreads.com/book/show/54845619-cracking-the-coding-interview) by Gayle Laakmann McDowell
* [VisuAlgo](https://visualgo.net/en), visualising data structures and algorithms through animations
* [Algorithms playlist](https://www.youtube.com/watch?v=KEEKn7Me-ms&list=PLI1t_8YX-ApvMthLj56t1Rf-Buio5Y8KL) from HackerRank's YouTube channel
* [Data Structures playlist](https://www.youtube.com/watch?v=IhJGJG-9Dx8&list=PLI1t_8YX-Apv-UiRlnZwqqrRT8D1RhriX) from HackerRank's YouTube channel