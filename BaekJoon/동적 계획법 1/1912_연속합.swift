let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = numbers

for i in 1..<numbers.count {
    dp[i] = max(dp[i], dp[i] + dp[i - 1])
}

print(dp.sorted(by: >).first!)