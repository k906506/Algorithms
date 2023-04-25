let n = Int(readLine()!)!
let moving = readLine()!.split(separator: " ").map { Int(String($0))! }
let recharge = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: n)

dp[0] = recharge[0]
for i in 1..<n {
    dp[i] = min(dp[i - 1], recharge[i])
}

var answer = 0
for i in 0..<n - 1 {
    answer += moving[i] * dp[i]
}

print(answer)