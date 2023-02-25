let n = Int(readLine()!)!
var grapes = [Int](repeating: 0, count: n + 1)
var dp = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    grapes[i] = Int(readLine()!)!
}

switch n {
case 1:
    print(grapes[1])
case 2:
    print(grapes[1] + grapes[2])
default:
    dp[1] = grapes[1]
    dp[2] = grapes[1] + grapes[2]
    
    if n >= 3 {
        for i in 3...n {
            // i번째 포도주를 먹는 경우
            dp[i] = max(grapes[i] + grapes[i-1] + dp[i-3], grapes[i] + dp[i-2])
            
            // i번째 포도주를 먹지 않는 경우
            dp[i] = max(dp[i], dp[i-1])
        }
    }
    
    print(dp[n])
}
