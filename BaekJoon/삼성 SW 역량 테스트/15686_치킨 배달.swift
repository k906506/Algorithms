let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var board = [[Int]]()
var house = [[Int]]()
var chicken = [[Int]]()

var result = Int.max

for _ in 0..<input[0] {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<input[0] {
    for j in 0..<input[0] {
        if board[i][j] == 1 { // 집
            house.append([i, j])
        }
        else if board[i][j] == 2 { // 치킨 집
            chicken.append([i, j])
        }
    }
}

var alive = [Bool](repeating: false, count: chicken.count)
var alivePoint = [[Int]]()

dfs(0, -1)
print(result)

func dfs(_ depth: Int, _ before: Int) {
    if depth == input[1] {
        calculate()
        return
    }

    for i in 0..<chicken.count {
        if alive[i] == false, i > before { // 순열이 아닌 조합으로 접근 -> 시간 초과 발생하지 않음
            alive[i] = true
            alivePoint.append(chicken[i])

            dfs(depth + 1, i)

            alive[i] = false
            alivePoint.removeLast()
        }
    }
}

func calculate() {
    var sum = 0
    
    for housePoint in house {
        var temp = Int.max
        
        for chickenPoint in alivePoint {
            let distance = abs(housePoint[0] - chickenPoint[0]) + abs(housePoint[1] - chickenPoint[1])
            temp = min(temp, distance)
        }
        
        sum += temp
    }
    
    result = min(sum, result)
}