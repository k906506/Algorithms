let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int](repeating: 0, count: inputs[0] + 1)

for i in 1...inputs[0] {
    dp[i] = numbers[i - 1] + dp[i - 1]
}

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    print(dp[infos[1]] - dp[infos[0] - 1])
}