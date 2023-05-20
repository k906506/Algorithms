let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let tempertures = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: inputs[0] + 1)

for i in 1...inputs[0] {
    dp[i] = tempertures[i - 1] + dp[i - 1]
}

var ans = -2147483647

// 이틀부터 n일까지
for i in inputs[1]...inputs[0] {
    ans = max(ans, dp[i] - dp[i - inputs[1]])
}

print(ans)