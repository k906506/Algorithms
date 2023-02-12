import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var board = [[Int]](repeating: [Int](repeating: 0, count: input[1]), count: input[0])

for i in 0..<input[0] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 0..<input[1] {
        board[i][j] = points[j]
    }
}

let command = readLine()!.split(separator: " ").map { Int(String($0))! }
let dxdy = [ // 동 서 북 남
    [0, 1],
    [0, -1],
    [-1, 0],
    [1, 0]
]

var dice = [0, 0, board[input[2]][input[3]], 0, 0, 0] // 상 앞 하 뒤 좌 우

move()

func move() {
    var x = input[2]
    var y = input[3]

    for idx in command {
        let dir = dxdy[idx - 1]

        let nx = x + dir[0]
        let ny = y + dir[1]

        if nx >= 0, nx < input[0], ny >= 0, ny < input[1] {
            dice = rotation(direction: idx)
            
            if board[nx][ny] == 0 {
                board[nx][ny] = dice[2]
            } else if board[nx][ny] != 0 {
                dice[2] = board[nx][ny]
                board[nx][ny] = 0
            }

            print(dice[0])

            x = nx
            y = ny
        }

    }

}

func rotation(direction idx: Int) -> [Int] {
    switch idx {
    case 1:
        return [dice[4], dice[1], dice[5], dice[3], dice[2], dice[0]]
    case 2:
        return [dice[5], dice[1], dice[4], dice[3], dice[0], dice[2]]
    case 3:
        return [dice[1], dice[2], dice[3], dice[0], dice[4], dice[5]]
    default:
        return [dice[3], dice[0], dice[1], dice[2], dice[4], dice[5]]
    }
}