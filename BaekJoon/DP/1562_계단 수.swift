let n = Int(readLine()!)!
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 1024), count: 10), count: n + 1)
let mod = 1_000_000_000

if n < 10 {
    print(0)
} else {
    for i in 1..<10 {
        dp[1][i][1 << i] = 1 // 기저
    }
    
    for i in 2...n {
        for j in 0..<10 {
            for k in 0..<1024 {
                if j == 0 {
                    dp[i][0][k | (1 << 0)] = (dp[i][0][k | (1 << 0)] + dp[i - 1][1][k]) % mod
                } else if j == 9 {
                    dp[i][9][k | (1 << 9)] = (dp[i][9][k | (1 << 9)] + dp[i - 1][8][k]) % mod
                } else {
                    dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][j - 1][k]) % mod
                    dp[i][j][k | (1 << j)] = (dp[i][j][k | (1 << j)] + dp[i - 1][j + 1][k]) % mod
                }
            }
        }
    }
    
    var ans = 0
    for i in 0..<10 {
        ans = (ans + dp[n][i][1023]) % mod
    }
    
    print(ans)
}