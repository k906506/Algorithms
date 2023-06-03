let INF = 2147483647
let n = Int(readLine()!)!
var metrixs = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 501)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 501), count: 501)

for i in 1...n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    metrixs[i][0] = infos[0]
    metrixs[i][1] = infos[1]
}

for i in 1..<n { // 구간의 간격
    for j in 1...n - i { // 구간의 시작 지점
        dp[j][i + j] = INF // (i, i + j) 초기화
        
        for k in j..<i + j { // 구간의 끝 지점
            dp[j][i + j] = min(dp[j][i + j], dp[j][k] + dp[k + 1][i + j] + metrixs[j][0] * metrixs[k][1] * metrixs[i + j][1])
        }
    }
}

print(dp[1][n])