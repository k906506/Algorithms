let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 31) // 최대값 30

if n % 2 != 0 { // 홀수일 때는 탐색 X
    print(0)
} else {
    dp[0] = 1
    dp[2] = 3
    
    if n >= 4 {
        for i in 4...n {
            dp[i] = dp[i - 2] * 3
            
            for j in stride(from: 4, through: n, by: 2) { // n이 4, 6, 8 .. 일때 새로운 형태를 가짐
                if j <= i {
                    dp[i] += dp[i - j] * 2
                }
            }
        }
    }
    
    print(dp[n])
}