let n = Int(readLine()!)!
var board = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)

let direction = [
    [0, 1],
    [-1, 0],
    [0, -1],
    [1, 0]
]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! } // 시작, 도착, 방향, 세대

    dfs(input[3], 0, [input[2]], input[1], input[0])
}

calculate()

func dfs(_ maxDepth: Int, _ depth: Int, _ stack: [Int], _ x: Int, _ y: Int) {
    if maxDepth == depth {
        draw(stack, x, y)
        return
    }
    
    var temp = stack

    // 뒤에서부터 탐색
    for idx in stride(from: stack.count - 1, through: 0, by: -1) {
        let dir = (stack[idx] + 1) % 4
        temp.append(dir)
    }
    
    dfs(maxDepth, depth + 1, temp, x, y)
}

func draw(_ stack: [Int], _ s_x: Int, _ s_y: Int) {
    var x = s_x
    var y = s_y
    
    board[x][y] = 1

    for dir in stack {
        x += direction[dir][0]
        y += direction[dir][1]

        if x >= 0, x < 101, y >= 0, y < 101 {
            board[x][y] = 1
        }
    }
}

func calculate() {
    var cnt = 0

    for i in 0..<100 {
        for j in 0..<100 {
            if validate(i, j) == 1 {
                cnt += 1
            }
        }
    }

    print(cnt)
}

/// 네 점이 모두 1인 경우에만 1을 리턴
func validate(_ x: Int, _ y: Int) -> Int {
    return board[x][y] * board[x + 1][y] * board[x][y + 1] * board[x + 1][y + 1] 
}
