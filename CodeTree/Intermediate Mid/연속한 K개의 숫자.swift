let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = [Int](repeating: 0, count: inputs[0] + 1)
var dp = [Int](repeating: 0, count: inputs[0] + 1)
var answer = Int.max

for _ in 0..<inputs[2] {
    let index = Int(readLine()!)!

    numbers[index] = 1
}

for i in 1...inputs[0] {
    dp[i] = dp[i - 1] + numbers[i]
}

for i in inputs[1]...inputs[0] {
    answer = min(answer, dp[i] - dp[i - inputs[1]])
}

print(answer)