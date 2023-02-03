import Foundation

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = info[0]
let l = info[1]

var board = [[Int]]()
var reverseBoard = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var result = 0

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<n {
    for j in 0..<n {
        reverseBoard[i][j] = board[j][i]
    }
}

result += calculate(board)
result += calculate(reverseBoard)

print(result)

func calculate(_ array: [[Int]]) -> Int {
    var cnt = 0
    let board = array
    
    for i in 0..<n {
        var same = 1
        var check = true
        var pass = 0
        
        for j in 0..<n-1 {
            if pass > 0 {
                pass -= 1
                continue
            }
            
            if board[i][j] == board[i][j + 1] {
                same += 1
            } else if board[i][j] == board[i][j + 1] + 1 { // 다음 위치가 더 낮으면
                if isCheck(i, j, board[i][j + 1], board) { // 경사로를 놓을 수 있을 때
                    pass = l - 1 // 반복문을 건너뛰기 위한 변수
                    same = 0
                } else {
                    check = false
                    break
                }
            } else if board[i][j] + 1 == board[i][j + 1] { // 다음 위차가 더 높으면
                if same - l >= 0 {
                    same = 1
                } else {
                    check = false
                    break
                }
            } else {
                check = false
                break
            }
        }
        
        if check {
            cnt += 1
        }
    }
    
    return cnt
}

func isCheck(_ x: Int, _ y: Int, _ standard: Int, _ board: [[Int]]) -> Bool {
    for i in y+1..<y+1+l {
        if i >= n { return false } // 범위를 넘어가면 종료
        if board[x][i] != standard { return false }
    }
    
    return true
}