import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var board = [[Int]]()
var result = 0

for _ in 0..<input[0] {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

buildWall(0)

print(result)

func buildWall(_ depth: Int) {
    if depth >= 3 {
        // 바이러스 전염 시작
        infectVirus()
        return
    }
    
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if board[i][j] == 0 {
                board[i][j] = 1
                buildWall(depth + 1)
                board[i][j] = 0
            }
        }
    }
}

func infectVirus() {
    var queue = [[Int]]()

    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if board[i][j] == 2 {
                queue.append([i, j])
            }
        }
    }

    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    var check = board

    while !queue.isEmpty {
        let current = queue.removeFirst()

        for i in 0..<4 {
            let nx = current[0] + dx[i]
            let ny = current[1] + dy[i]
            
            if nx >= 0, nx < input[0], ny >= 0, ny < input[1] {
                if check[nx][ny] != 0 { continue }
                
                check[nx][ny] = 2
                queue.append([nx, ny])
            }
        }
    }

    var cnt = 0

    for row in check {
        cnt += row.filter { $0 == 0 }.count
    }

    result = max(result, cnt)
}