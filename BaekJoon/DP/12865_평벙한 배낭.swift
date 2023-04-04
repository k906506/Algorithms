let info = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: info[1] + 1)
var items = [[Int]]()

for _ in 0..<info[0] {
    let item = readLine()!.split(separator: " ").map { Int(String($0))! }
    items.append(item) // [weight, value]
}

for i in 1...info[0] { // 물건
    for j in stride(from: info[1], through: 0, by: -1) { // 가방 용량
        if j >= items[i - 1][0] { // 가방에 넣을 수 있는 경우
            dp[j] = max(dp[j] , dp[j - items[i - 1][0]] + items[i - 1][1])
        }
    }
}

print(dp[info[1]])