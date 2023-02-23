let n = Int(readLine()!)!
var stair = [Int]()
var dp = [Int](repeating: 0, count: n)

for _ in 0..<n {
    stair.append(Int(readLine()!)!)
}

if n == 1 {
    print(stair[0])
} else if n == 2 {
    print(stair[0] + stair[1])
} else {
    dp[0] = stair[0]
    dp[1] = stair[0] + stair[1]
    dp[2] = max(stair[0] + stair[2], stair[1] + stair[2])

    for i in 3..<n {
        dp[i] = max(stair[i - 1] + dp[i - 3], dp[i - 2]) + stair[i]
    }

    print(dp[n - 1])
}