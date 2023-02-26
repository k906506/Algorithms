let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 1, count: n)

for i in 1..<n { // 기준
    for j in 0..<i { // 탐색
        if numbers[j] < numbers[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.sorted(by: >).first!)
