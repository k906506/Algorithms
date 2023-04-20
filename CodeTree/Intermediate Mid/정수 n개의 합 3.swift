let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var boards = [[Int]](repeating: [Int](repeating: 0, count: inputs[0] + 1), count: inputs[0] + 1)
var dp = [[Int]](repeating: [Int](repeating: 0, count: inputs[0] + 1), count: inputs[0] + 1)

for i in 1...inputs[0] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 1...inputs[0] {
        boards[i][j] = infos[j - 1]
    }
}

var sum = 0
for i in 1...inputs[0] {
    for j in 1...inputs[0] {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1] + boards[i][j]
    }
}

var answer = 0
for i in (0 + inputs[1])...inputs[0] {
    for j in (0 + inputs[1])...inputs[0] {
        answer = max(answer, dp[i][j] - dp[i][j - inputs[1]] - dp[i - inputs[1]][j] + dp[i - inputs[1]][j - inputs[1]])
    }
}

print(answer)