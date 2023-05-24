let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

switch n {
case 0:
    print(0)
case 1:
    print(1)
default:
    dp[1] = 1

    for i in 2...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }

    print(dp[n])
}
