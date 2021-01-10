// https://leetcode.com/problems/count-primes/

import Foundation

/**
 Sieve of erathostenes
 - If a number is prime, its multiples are primes too
 */
class Solution {
    func countPrimes(_ n: Int) -> Int {
        
        if n < 3 { return 0 }
        
        // Assume all of the numbers are not prime
        var primes = Array(repeating: false, count: n)
        var counter = 0
        
        for i in 2..<n {
            
            // If true the current iteration is a prime and all of its
            // multiples have been marked as primes too
            if primes[i] { continue }
            
            // Increase the number of primes
            counter += 1
            
            var element = i
            
            // Mark the multiples of the current number to not be counted in the
            // next iteration
            while element < n {
                
                primes[element] = true
                element += i
            }
        }
               
        return counter
    }
    
    /**
     This is a more visual Sieve of Erathostenes but it's O(n^2)
     */
    func countPrimes2(_ n: Int) -> Int {

        if n < 3 { return 0 }

        // Assume all of the numbers are prime
        var primes = Array(repeating: true, count: n)
        var counter = 0

        for i in 2..<n {

            if primes[i] == false { continue }

            // It has not been marked previously as a multiple so
            // it's still a prime number for us
            if primes[i] == true {
                for j in 2..<n {
                    if j*i < n && primes[j*i] {
                        primes[j*i] = false
                    }
                }
            }
        }

        primes = Array(primes[2..<n])

        for (_, prime) in primes.enumerated() {
            if prime {
                counter += 1
            }
        }

        return counter

    }
}
let s = Solution()
s.countPrimes(10)


