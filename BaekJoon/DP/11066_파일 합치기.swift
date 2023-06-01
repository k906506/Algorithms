let t = Int(readLine()!)!
let INF = 2147483647

for _ in 0..<t {
    let k = Int(readLine()!)!
    let pages = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var sums = [Int](repeating: 0, count: k + 1)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: k + 1)
    
    for i in 1...k {
        sums[i] = sums[i - 1] + pages[i - 1]
    }
    
    calculate(k, &dp, &sums)
}

func calculate(_ num: Int, _ dp: inout [[Int]], _ sums: inout [Int]) {
    for i in 1..<num {
        for j in 1...num - i {
            let k = i + j
            dp[j][k] = INF
            
            for l in j..<k {
                dp[j][k] = min(dp[j][k], dp[j][l] + dp[l + 1][k] + sums[k] - sums[j - 1])
            }
        }
    }
    
    print(dp[1][num])
}
