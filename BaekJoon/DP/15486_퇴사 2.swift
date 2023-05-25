// i일 전까지 일했을 때 받을 수 있는 최대 금액
let n = Int(readLine()!)!
var deadlines = [Int](repeating: 0, count: n + 2)
var prices = [Int](repeating: 0, count: n + 2)
var dp = [Int](repeating: 0, count: n + 2)

for i in 1...n {
    let infos = Int(readLine()!)!

    deadlines[i] = infos[0]
    prices[i] = infos[1]
}

var maxPrice = 0
for i in 1...n {
    maxPrice = max(maxPrice, dp[i])

    if i + deadlines[i] > n + 1 { continue } // 탐색 범위를 벗어난 경우

    dp[i + deadlines[i]] = max(maxPrice + prices[i], dp[i + deadlines[i]])
}

print(maxPrice)