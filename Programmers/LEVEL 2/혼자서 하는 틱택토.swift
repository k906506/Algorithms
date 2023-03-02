import Foundation

func solution(_ board:[String]) -> Int {
    let pickerCount = countPickerOnBoard(board)

    // O가 선공이므로 정상적인 게임의 경우 항상 더 많음
    if pickerCount[0] < pickerCount[1] {
        return 0 // 잘못된 경우
    } else if pickerCount[0] > pickerCount[1] {
        // 선공, 후공을 주고 받으므로 정상적인 게임의 경우 (선공 - 후공)은 항상 1
        if pickerCount[0] - pickerCount[1] > 1 {
            return 0 // 잘못된 경우 
        } else {
            // 선공이 더 많아도 후공이 한 줄이 완성되면 안됨 (선공: 4, 후공: 3)일 떄를 생각해보자
            if checkWhoIsWin(board, "X") {
                return 0 // 잘못된 경우
            } else {
                return 1
            }
        }
    } else { // O, X가 같을 떄, 정상적인 게임의 경우 아직 게임이 진행 중이거나, 후공이 이겨야 함
        if checkWhoIsWin(board, "O") {
            return 0 // 잘못된 경우
        } else {
            return 1
        }
    }
}

func countPickerOnBoard(_ board: [String]) -> [Int] {
    var o = 0
    var x = 0
    
    for row in board {
        for col in row {
            if col == "O" { o += 1 }
            else if col == "X" { x += 1 }
        }
    }
    
    return [o, x]
}

func checkWhoIsWin(_ board: [String], _ target: String) -> Bool {   
    // 가로
    for i in 0..<3 {
        var cnt = 0
        
        for j in 0..<3 {
            if board[i][j] == target { cnt += 1}
        }
        
        if cnt == 3 { return true }
    }
    
    // 세로
    for i in 0..<3 {
        var cnt = 0
        
        for j in 0..<3 {
            if board[j][i] == target { cnt += 1 }
        }
        
        if cnt == 3 { return true }
    }
    
    // 대각선
    if board[0][0] == target, board[1][1] == target, board[2][2] == target { return true }
    if board[2][0] == target, board[1][1] == target, board[0][2] == target { return true }
    
    return false
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}