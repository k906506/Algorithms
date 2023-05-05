let n = Int(readLine()!)!
var boards = [[Int]]()

for _ in 0..<n {
    boards.append(readLine()!.map { Int(String($0))! })
}

divide(0, 0, n)

func divide(_ row: Int, _ col: Int, _ size: Int) {
    let color = boards[row][col]

    for i in row..<row + size {
        for j in col..<col + size {
            if boards[i][j] != color {
                print("(", terminator: "")
                divide(row, col, size / 2)
                divide(row, col + size / 2, size / 2)
                divide(row + size / 2, col, size / 2)
                divide(row + size / 2, col + size / 2, size / 2)
                print(")", terminator: "")
                return
            }
        }
    }

    print(color, terminator: "")
}