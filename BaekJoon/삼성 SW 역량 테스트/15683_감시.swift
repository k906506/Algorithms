import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var board = [[Int]]()
var cctv = [[Int]]()

let type = [
    [[0], [1], [2], [3]],
    [[0, 2], [1, 3]],
    [[0, 1], [1, 2], [2, 3], [3, 0]],
    [[0, 1, 2], [1, 2, 3], [2, 3, 0], [3, 0, 1]],
    [[0, 1, 2, 3]]
]

let dxdy = [
   [-1, 0], [0, 1], [1, 0], [0, -1]
]

var result = 64

for _ in 0..<input[0] {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<input[0] {
    for j in 0..<input[1] {
        if board[i][j] >= 1, board[i][j] <= 5 {
            cctv.append([i, j, board[i][j] - 1])
        }
    }
}

dfs(0, board)
print(result)

func dfs(_ depth: Int, _ array: [[Int]]) {
    if depth == cctv.count {
        result = min(result, calculateArea(array))
        return
    }

    var temp = array // 배열 복사

    let info = cctv[depth] // x, y, cctv 타입

    for dir in type[info[2]] {
        temp = findPath(info[0], info[1], dir, temp)
        dfs(depth + 1, temp)
        
        temp = array // 다시 원래 배열로 돌려 놓기
    }
}

func findPath(_ x: Int, _ y: Int, _ dir: [Int], _ array: [[Int]]) -> [[Int]] {
    var temp = array // 배열 복사

    for idx in dir {
        var nx = x + dxdy[idx][0]
        var ny = y + dxdy[idx][1]

        while true {
            if nx >= 0, nx < input[0], ny >= 0, ny < input[1], temp[nx][ny] <= 5 {
                temp[nx][ny] = -1 // # 대신 -1

                nx += dxdy[idx][0]
                ny += dxdy[idx][1]
            } else {
                break
            }
        }
    }

    return temp
}

func calculateArea(_ array: [[Int]]) -> Int {
    return array.flatMap { $0 }.compactMap { $0 }.filter { $0 == 0 }.count
}