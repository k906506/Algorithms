let n = Int(readLine()!)!
var dp = [Int](repeating: 1, count: 11)

for _ in 0..<n {
    let num = Int(readLine()!)!
    
    print(findAnswer(num))
}

func findAnswer(_ num: Int) -> Int {
    switch num {
    case 1:
        return 1
    case 2:
        return 2
    case 3:
        return 4
    default:
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        
        for i in 4...num {
            dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
        }
        
        return dp[num]
    }
}

let n = Int(readLine()!)!
var stairs = [Int](repeating: 0, count: n + 1)
var dp = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
    stairs[i + 1] = Int(readLine()!)!
}

dp[1] = stairs[1]
dp[2] = stairs[1] + stairs[2]

for i in 3...n {
    dp[i] = max(dp[i - 1] + dp[i - 3], dp[i - 2] + dp[i - 3]) + stairs[i]
}

print(dp[n])