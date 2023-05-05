let n = Int(readLine()!)!
var boards = [[Int]]()
var minus = 0
var zero = 0
var plus = 0

for _ in 0..<n {
    boards.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

divide(0, 0, n)

print(minus)
print(zero)
print(plus)

func divide(_ row: Int, _ col: Int, _ size: Int) {
    let type = boards[row][col]
    
    for i in row..<row + size {
        for j in col..<col + size {
            if boards[i][j] != type {
                divide(row, col, size / 3)
                divide(row, col + size / 3, size / 3)
                divide(row, col + size * 2 / 3, size / 3)
                divide(row + size / 3, col, size / 3)
                divide(row + size / 3, col + size / 3, size / 3)
                divide(row + size / 3, col + size * 2 / 3, size / 3)
                divide(row + size * 2 / 3, col, size / 3)
                divide(row + size * 2 / 3, col + size / 3, size / 3)
                divide(row + size * 2 / 3, col + size * 2 / 3, size / 3)
                return
            }
        }
    }
    
    switch type {
    case -1:
        minus += 1
    case 0:
        zero += 1
    default:
        plus += 1
    }
}