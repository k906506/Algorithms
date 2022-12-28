import Foundation

let n = Int(readLine()!)!
var info: [[Int]] = []
var check: [Bool] = [Bool](repeating: false, count: n)
var ans = Int.max

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    info.append(input)
}

func dfs(idx: Int, depth: Int) {
    if depth == n / 2 {
        var start = 0
        var link = 0
        
        for i in 0..<n {
            for j in 0..<n {
                if i == j { continue }
                
                if check[i], check[j] { start += info[i][j] }
                
                if !check[i], !check[j] { link += info[i][j] }
            }
        }
        
        ans = min(ans, abs(start - link))
    }
    
    for i in idx..<n {
        check[i] = true
        dfs(idx: i + 1, depth: depth + 1)
        check[i] = false
    }
}

dfs(idx: 0, depth: 0)

print(ans)