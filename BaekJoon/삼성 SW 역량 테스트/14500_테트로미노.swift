import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var board = [[Int]]()
var check = [[Bool]](repeating: [Bool](repeating: false, count: input[1]), count: input[0])

for _ in 0..<input[0] {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

/// 상, 우, 하, 좌
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

var result = 0

for i in 0..<input[0] {
    for j in 0..<input[1] {
        check[i][j] = true
        dfs(i, j, 1, board[i][j])
        check[i][j] = false
        
        reverseT(i, j)
    }
}

print(result)

func dfs(_ x: Int, _ y: Int, _ depth: Int, _ sum: Int) {
    if depth >= 4 {
        result = max(result, sum)
        return
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0, nx < input[0], ny >= 0, ny < input[1], !check[nx][ny] {
            check[nx][ny] = true
            dfs(nx, ny, depth + 1, sum + board[nx][ny])
            check[nx][ny] = false
        }
    }
}

func reverseT(_ x: Int, _ y: Int) {
    let dxdy = [
        [-1, 0, 0, 0],
        [0, -1, 0, 1],
        [0, -1, 0, 1],
        [1, 0, 0, 0],
        [1, 0, 0, 0],
        [0, 1, 0, -1],
        [0, 1, 0, -1],
        [-1, 0, 0, 0]
    ]
    
    for i in 0..<4 {
        var sum = 0
        
        for j in 0..<4 {
            let nx = x + dxdy[2 * i][j]
            let ny = y + dxdy[2 * i + 1][j]
            
            if nx >= 0, nx < input[0], ny >= 0, ny < input[1] {
                sum += board[nx][ny]
            }
        }
        
        result = max(result, sum)
    }
}
