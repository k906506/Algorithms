// 나눌 수 없을 때까지 나눈다.
let n = Int(readLine()!)!
var papers = [[Int]]()
var blue = 0
var white = 0

for _ in 0..<n {
    papers.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

divide(0, 0, n)

print(white)
print(blue)

func divide(_ row: Int, _ col: Int, _ size: Int) {
    let color = papers[row][col] // 시작 지점의 색상
    
    for i in row..<row + size {
        for j in col..<col + size {
            if papers[i][j] != color { // 기준 색상과 다르면, 분할
                divide(row, col, size / 2)
                divide(row, col + size / 2, size / 2)
                divide(row + size / 2, col, size / 2)
                divide(row + size / 2, col + size / 2, size / 2)
                return
            }
        }
    }
    
    if color == 1 {
        blue += 1
    } else {
        white += 1
    }
}