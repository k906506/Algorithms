let n = Int(readLine()!)!
var boards = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
var answer = Int.min

for i in 1...n {
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 1...n {
        boards[i][j] = inputs[j - 1]
    }
}

for i in 1...n {
    for j in 1...n {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1] + boards[i][j]
    }
}

for i in 1...n {
    for j in i...n {
        var temp = [Int](repeating: 0, count: n + 1)

        for col in 1...n {
            let value = getPrefixSum(i, col, j, col)

            temp[col] = max(value, temp[col - 1] + value)
        }
        
        answer = max(answer, temp[1...n].max()!)
    }
}

func getPrefixSum(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return dp[x2][y2] - dp[x1 - 1][y2] - dp[x2][y1 - 1] + dp[x1 - 1][y1 - 1]
}

print(answer)