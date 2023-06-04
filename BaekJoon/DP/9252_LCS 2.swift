let s1 = readLine()!.map { String($0) }
let s2 = readLine()!.map { String($0) }
var dp = [[Int]](repeating: [Int](repeating: 0, count: s1.count + 1), count: s2.count + 1)

// LCS 탐색
for i in 1...s2.count {
    for j in 1...s1.count {
        if s2[i - 1] == s1[j - 1] {
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
    }
}

// LCS 역추적
var row = s2.count
var col = s1.count
var lcs = ""
var before = dp[row][col]

if before == 0 { print(before) }
else {
    while row > 0, col > 0 {
        if dp[row][col] == dp[row - 1][col] { row -= 1 }
        else if dp[row][col] == dp[row][col - 1] { col -= 1 }
        else {
            lcs += s1[col - 1]
            row -= 1
            col -= 1
        }
    }
    
    print(before)
    print(String(lcs.reversed()))
}