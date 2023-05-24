let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

if n == 1 {
    print(1)
} else {
    for i in 2...n {
        dp[i] = dp[i - 1] + 1
        
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i / 3] + 1)
        }
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i / 2] + 1)
        }
    }

    print(dp[n])
}