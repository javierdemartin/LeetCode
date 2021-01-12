// https://leetcode.com/problems/product-of-the-last-k-numbers

import Foundation

/**
 - time complexity: O(N)
 - space complexity: O(1)
 */


class ProductOfNumbers {

    var products: [Int] = []
    
    init() { }
    
    func add(_ num: Int) {
        if num == 0 {
            products = []
        } else if products.isEmpty {
            products.append(num)
        } else {
            products.append(num * products[products.count - 1])
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        if k > products.count {
            return 0
        } else if k == products.count {
            return products[products.count - 1]
        } else {
            return products[products.count - 1] / products[products.count - 1 - k]
        }
    }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */



