let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: inputs[0])
var sum = 0
var answer = 0

for i in 0..<inputs[0] {
    dp[i] = sum + numbers[i]
    sum += numbers[i]
}

for i in inputs[1] - 1..<inputs[0] {
    if i == inputs[1] - 1 {
        answer = max(answer, dp[i])
    } else {
        answer = max(answer, dp[i] - dp[i - inputs[1]])
    }
}

print(answer)