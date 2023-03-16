import Foundation

let n = Int(readLine()!)!

var isVisited = [Bool](repeating: false, count: n + 1)
var isPrime = [Int]()

if n == 1 {
    print(0)
    exit(0)
}

// 소수 판별
for i in 2...n {
    var idx = i * 2
    
    while true {
        if idx > n { break }
        
        isVisited[idx] = true
        
        idx += i
    }
}

for i in 2...n {
    if !isVisited[i] {
        isPrime.append(i)
    }
}

var left = 0
var right = 0
var sum = 0
var cnt = 0

while true {
    if sum >= n {
        if sum == n { cnt += 1}
        
        sum -= isPrime[left]
        left += 1
    } else {
        if right == isPrime.count {
            sum -= isPrime[left]
            left += 1
        } else {
            sum += isPrime[right]
            right += 1
        }
    }
    
    if left == isPrime.count { break }
}

print(cnt)