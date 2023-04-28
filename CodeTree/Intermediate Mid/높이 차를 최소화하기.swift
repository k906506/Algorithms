// BFS로 (1,1) -> (n,m) 을 수행하되, 높이 차이를 임의의 수로 정하고 Parametric Search를 진행

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var boards = [[Int]]()

for _ in 0..<inputs[0] {
    boards.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: inputs[1]), count: inputs[0])

var left = 0
var right = 500
var answer = 500

// 이동 가능한 최대 높이 차이 계산
while left <= right {
    let mid = (left + right) / 2

    if isPossible(mid) { // 이동이 가능하므로, 높이 차이를 더 줄임
        right = mid - 1
        answer = min(answer, mid)
    } else {
        left = mid + 1
    }
}

print(answer)

func isPossible(_ gap: Int) -> Bool {
    for low in 1...500 {
        let high = low + gap

        if boards[0][0] >= low, boards[0][0] <= high {
            let result = bfs(low, high)

            if result {
                return true
            }
        }
    }

    return false
}

func bfs(_ low: Int, _ high: Int) -> Bool {
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    var stack = [[0, 0]]
    var tempVisited = visited
    tempVisited[0][0] = true

    while !stack.isEmpty {
        let current = stack.removeFirst()

        for i in 0..<4 {
            let nx = current[0] + dx[i]
            let ny = current[1] + dy[i]

            if nx >= 0, nx < inputs[0], ny >= 0, ny < inputs[1], tempVisited[nx][ny] == false {
                if boards[nx][ny] >= low, boards[nx][ny] <= high { // 높이의 차가 gap 이하일 때 이동 가능
                    tempVisited[nx][ny] = true // 방문 여부 변경
                    stack.append([nx, ny])
                }
            }
        }
    }

    return tempVisited[inputs[0] - 1][inputs[1] - 1] // (n,m)이 방문 가능한 경우 true
}