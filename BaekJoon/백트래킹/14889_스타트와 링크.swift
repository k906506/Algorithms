import Foundation

let n = Int(readLine()!)!
var board = [[Int]]()
var visited = [Bool](repeating: false, count: n)

var result = Int.max

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

calculate(0, 0)

print(result)

func calculate(_ idx: Int, _ depth: Int) {
    if depth == n / 2 {
        var start = 0
        var link = 0
        
        for i in 0..<n - 1 {
            for j in i..<n {
                if visited[i], visited[j] {
                    start += board[i][j]
                    start += board[j][i]
                }
                
                if !visited[i], !visited[j] {
                    link += board[i][j]
                    link += board[j][i]
                }
            }
        }
        
        result = min(abs(start - link), result)
        return
    }
    
    // 팀원을 선택하는 경우의 수를 계산 (조합)
    for i in idx..<n {
        if !visited[i] {
            visited[i] = true
            calculate(i + 1, depth + 1)
            visited[i] = false
        }
    }
}
