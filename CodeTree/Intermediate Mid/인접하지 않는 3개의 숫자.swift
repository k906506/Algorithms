let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var left = [Int](repeating: 0, count: n + 2)
var right = [Int](repeating: 0, count: n + 2)

// 1. Left Sum
for i in 1...n {
    left[i] = max(left[i - 1], numbers[i - 1])
}

// 2. Right Sum
for i in stride(from: n, to: 0, by: -1) {
    right[i] = max(right[i + 1], numbers[i - 1])
}

var answer = 0
for i in 3...n - 2 {
    answer = max(answer, left[i - 2] + numbers[i - 1] + right[i + 2])
}

print(answer)