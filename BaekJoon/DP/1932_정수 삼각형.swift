let n = Int(readLine()!)!
var board = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dp[0] = board[0]

for i in 1..<n {
    for j in 0...i {
        if j == 0 {
            dp[i][j] = dp[i - 1][j] + board[i][j]
        } else if j == i {
            dp[i][j] = dp[i - 1][j - 1] + board[i][j]
        } else {
            dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + board[i][j]
        }
    }
}

print(dp[n - 1].sorted(by: >).first!)