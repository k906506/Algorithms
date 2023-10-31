let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var boards = [[Int]]()

for _ in 0..<inputs[0] {
    boards.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

if inputs[0] == 1 {
    print(0)
} else {
    var day = 0
    
    while true {
        let result = isPossibleToOpenBoundary(boards, inputs[2], inputs[1], inputs[0])
        
        if result[0].count == 0 { break }
        else {
            movePopluation(&boards, result, inputs[0])
            day += 1
        }
    }
    
    print(day)
}

// 국경이 열리는지 확인하는 메서드
func isPossibleToOpenBoundary(_ boards: [[Int]], _ high: Int, _ low: Int, _ n: Int) -> [[Bool]] {
    var isPossible = false
    var isOpenedBoards = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n - 1 {
            let rowGap = abs(boards[j + 1][i] - boards[j][i])
            let colGap = abs(boards[i][j + 1] - boards[i][j])
            
            if rowGap >= low, rowGap <= high {
                isPossible = true
                isOpenedBoards[j][i] = true
                isOpenedBoards[j + 1][i] = true
            }
            
            if colGap >= low, colGap <= high {
                isPossible = true
                isOpenedBoards[i][j] = true
                isOpenedBoards[i][j + 1] = true
            }
        }
    }
    
    // (n - 1, n - 1) 좌표 비교를 위해 한 번 더 진행
    let rowGap = abs(boards[n - 1][n - 1] - boards[n - 1][n - 2])
    let colGap = abs(boards[n - 1][n - 1] - boards[n - 2][n - 1])
    
    if rowGap >= low, rowGap <= high {
        isPossible = true
        isOpenedBoards[n - 1][n - 1] = true
        isOpenedBoards[n - 1][n - 2] = true
    }
    
    if colGap >= low, colGap <= high {
        isPossible = true
        isOpenedBoards[n - 1][n - 1] = true
        isOpenedBoards[n - 2][n - 1] = true
    }
    
    return isPossible ? isOpenedBoards : [[]]
}

// 국경이 열렸으면 인구수를 조정하는 메서드
func movePopluation(_ boards: inout [[Int]], _ isOpenedBoards: [[Bool]], _ n: Int) {
    var population = 0
    var country = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if isOpenedBoards[i][j] {
                population += boards[i][j]
                country += 1
            }
        }
    }
    
    let movedPopluation = population / country
    
    for i in 0..<n {
        for j in 0..<n {
            if isOpenedBoards[i][j] {
                boards[i][j] = movedPopluation
            }
        }
    }
}