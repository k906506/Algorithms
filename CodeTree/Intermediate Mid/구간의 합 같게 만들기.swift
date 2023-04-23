import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

if numbers.reduce(0, +) % 4 != 0 {
    print(0)
    exit(0)
}

var left = [Int](repeating: 0, count: n)
var right = [Int](repeating: 0, count: n)
let target = numbers.reduce(0, +) / 4 // 네 개의 구간으로 나누었을 때, 한 구간의 합

var cnt = 0
var sum = 0
for i in 0..<n {
    sum += numbers[i]

    if sum == 2 * target {
        left[i] = cnt
    }

    if sum == target {
        cnt += 1
    }
}

cnt = 0
sum = 0
for i in stride(from: n - 1, to: -1, by: -1) {
    sum += numbers[i]

    if sum == 2 * target {
        right[i] = cnt
    }

    if sum == target {
        cnt += 1
    }
}

var answer = 0
for i in 0..<n - 1 {
    answer += left[i] * right[i + 1]
}

print(answer)