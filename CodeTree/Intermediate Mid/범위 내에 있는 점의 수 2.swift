let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: 1000001)

for number in numbers {
    dp[number] += 1
}

for i in 1...1000000 {
    dp[i] += dp[i - 1] 
}

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    if infos[0] == 0 {
        print(dp[infos[1]])
    } else {
        print(dp[infos[1]] - dp[infos[0] - 1])
    }
}