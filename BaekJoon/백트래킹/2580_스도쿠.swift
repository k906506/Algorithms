import Foundation

var board: [[Int]] = []

// 스도쿠 추가
for _ in 0..<9 {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

sudoku(0, 0)

func sudoku(_ x: Int, _ y: Int) {
    if y == 9 {
        sudoku(x + 1, 0)
    }
    
    if x == 9 {
        var result = ""
        
        board.forEach { row in
            let array = row.map { String($0) }
            result += array.joined(separator: " ")
            result += "\n"
        }
        
        print(result)
        exit(0)
    }
    
    if board[x][y] == 0 {
        for i in 1...9 {
            if (check(x, y, i)) {
                board[x][y] = i
                sudoku(x, y + 1)
                board[x][y] = 0
            }
        }
    } else {
        sudoku(x, y + 1)
    }
}


func check(_ x: Int, _ y: Int, _ e: Int) -> Bool {
    // 가로, 세로 체크
    for i in 0..<9 {
        if board[x][i] == e || board[i][y] == e { return false }
    }
    
    // 3*3 체크
    let r_index = x / 3 * 3
    let c_index = y / 3 * 3
    
    for i in r_index..<r_index + 3 {
        for j in c_index..<c_index + 3 {
            if board[i][j] == e { return false }
        }
    }
    
    // 세 가지 조건을 모두 통과하면 true
    return true
}