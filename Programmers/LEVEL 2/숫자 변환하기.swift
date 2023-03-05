import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var dp = [Int](repeating: 1000001, count: y + 1)
    
    dp[x] = 0
    
    for i in x...y {
        if i % 3 == 0, i / 3 >= x {
            dp[i] = min(dp[i], dp[i / 3] + 1)
        } 
        
        if i % 2 == 0, i / 2 >= x {
            dp[i] = min(dp[i], dp[i / 2] + 1)
        } 
        
        if i - n >= x {
            dp[i] = min(dp[i], dp[i - n] + 1)
        }
    }
    
    return dp[y] == 1000001 ? -1 : dp[y]
}