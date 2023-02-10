import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let command = readLine()!.split(separator: " ").map { Int(String($0))! }

var board: [[Int]] = []
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: input[1]), count: input[0])
var cnt = 0

for _ in 0..<input[0] {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var queue: [[Int]] = []
queue.append(command)

while !queue.isEmpty {
    var current = queue.removeFirst()
    let dir = setDirection(current[2])
    
    // 일단 현재 위치 청소
    if board[current[0]][current[1]] == 0, visited[current[0]][current[1]] == false {
        visited[current[0]][current[1]] = true // 청소하고
        cnt += 1 // 카운트 +1
    }
    
    var check = true
    
    // 설정한 탐색 좌표에 따라 탐색 진행
    for i in 0..<4 {
        let nx = current[0] + dir[0][i]
        let ny = current[1] + dir[1][i]
        
        if current[2] == 0 {
            current[2] = 3
        } else {
            current[2] -= 1
        }
        
        if nx >= 0, nx < input[0], ny >= 0, ny < input[1] {
            if board[nx][ny] == 0, visited[nx][ny] == false {
                visited[nx][ny] = true // 청소하고
                cnt += 1 // 카운트 +1
                queue.append([nx, ny, current[2]])// 해당 좌표로 이동
                check = false
                break // for문 종료
            }
        }
    }
    
    if check {
        // 네 방향 모두 청소가 되어 있거나, 벽인 경우
        // 후진이 가능한 경우
        if let next = checkReverse(current[0], current[1], current[2]) {
            queue.append(next)
        }
        else {
            break // 반복문 종료
        }
    }
}

print(cnt)

// 진행 방향에 따라 탐색 좌표를 설정하는 메서드
func setDirection(_ direction: Int) -> [[Int]] {
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    var nx = [Int]()
    var ny = [Int]()
    
    var index = direction
    
    while nx.count < 4 {
        if index == 0 {
            index = 3
        } else {
            index -= 1
        }
        
        nx.append(dx[index])
        ny.append(dy[index])
    }
    
    return [nx, ny]
}

/// 후진 가능 여부를 확인하고 가능하면 좌표를 리턴하는 메서드
func checkReverse(_ x: Int, _ y: Int, _ direction: Int) -> [Int]? {
    let dx = [1, 0, -1, 0]
    let dy = [0, -1, 0, 1]
    
    let nx = x + dx[direction]
    let ny = y + dy[direction]
    
    if nx >= 0, nx < input[0], ny >= 0, ny < input[1], board[nx][ny] == 0 {
        return [nx, ny, direction]
    } else {
        return nil
    }
}
