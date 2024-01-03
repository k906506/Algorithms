let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

if n == 1 {
    print(2)
} else if n == 2 {
    print(7) 
} else {
    dp[0] = 1
    dp[1] = 2
    dp[2] = 7
    
    for i in 3...n {
        dp[i] = (dp[i - 1] * 2 + dp[i - 2] * 3) % 1000000007

        for j in 0...i - 3 {
            dp[i] = (dp[i] + dp[i - 3 - j] * 2) % 1000000007
        }
    }

    print(dp[n])
}