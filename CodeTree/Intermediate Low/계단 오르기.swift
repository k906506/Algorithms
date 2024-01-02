let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

if n == 2 || n == 3 {
    print(1)
} else {
    dp[2] = 1
    dp[3] = 1
    
    for i in 4...n {
        dp[i] = (dp[i - 2] + dp[i - 3]) % 10007
    }

    print(dp[n])
}