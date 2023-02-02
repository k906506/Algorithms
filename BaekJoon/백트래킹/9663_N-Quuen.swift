let n = Int(readLine()!)!
var board: [[Bool]] = [[Bool]](repeating: [Int](repeating: false, count: n), count : n)
var cnt = 0

func nQueen(_ row: Int) {
    if row >= n { // 끝까지 도달한 경우
        cnt += 1
        return 
    }
    
    // board를 탐색
    for j in 0..< n {
        if !board[row][j] { // 아직 방문하지 않았다면
            if !check(row, j) { continue }

            board[row][j] = true
            nQueen(row + 1)
            board[row][j] = false
        }
    }
}

// 같은 열, 위쪽 대각선을 비교한다.
// 아래 대각선을 비교하지 않는 이유는 아직 지나치지 않았기 때문이다.
func check(_ x: Int, _ y: Int) -> Bool {
    for i in 0..<n {
        if board[i][y] { return false }
        if x - i >= 0 && y - i >= 0 && board[x - i][y - i] { return false }
        if x - i >= 0 && y + i < n && board[x - i][y + i] { return false }
    }

    return true
}

nQueen(0)
print(cnt)