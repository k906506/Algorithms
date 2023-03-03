import Foundation

func solution(_ maps:[String]) -> Int {
    let n = maps.count
    let m = maps[0].count
    var boards = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    var start = [0, 0]
    var end = [0, 0]
    var lever = [0, 0]
    var cnt = 0

    // 위치 저장
    for i in 0..<n {
        for j in 0..<m {
            if maps[i][j] == "S" {
                start = [i, j]
            } else if maps[i][j] == "E" {
                end = [i, j]
            } else if maps[i][j] == "L" {
                lever = [i, j]
            }
        }
    }

    // 상, 우, 하, 좌
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    var queue = [start]
    boards[start[0]][start[1]] = 0

    // (시작 -> 레버) 탐색 진행
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        // if (maps[current[0]][current[1]] == "L") { break }

        for i in 0..<4 {
            let nx = current[0] + dx[i]
            let ny = current[1] + dy[i]

            // 범위 내에 있고, 다음 위치가 통로이면서, 아직 방문하지 않았을 때
            if nx >= 0, nx < n, ny >= 0, ny < m, maps[nx][ny] != "X", boards[nx][ny] == -1 {
                boards[nx][ny] = boards[current[0]][current[1]] + 1
                queue.append([nx, ny])
            }
        }
    }

    var half = boards[lever[0]][lever[1]]
    
    if half == -1 { return -1 } // 레버를 당길 수 없으므로 미로를 탈출할 수 없음
    else { cnt += half }

    // (레버 -> 도착) 탐색 진행
    queue = [lever]
    boards = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    boards[lever[0]][lever[1]] = 0

    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        // if (maps[current[0]][current[1]] == "E") { break }

        for i in 0..<4 {
            let nx = current[0] + dx[i]
            let ny = current[1] + dy[i]

            // 범위 내에 있고, 다음 위치가 통로이면서, 아직 방문하지 않았을 때
            if nx >= 0, nx < n, ny >= 0, ny < m, maps[nx][ny] != "X", boards[nx][ny] == -1 {
                boards[nx][ny] = boards[current[0]][current[1]] + 1
                queue.append([nx, ny])
            }
        }
    }
    
    half = boards[end[0]][end[1]]

    if half == -1 { return -1 } // 레버를 당길 수 없으므로 미로를 탈출할 수 없음
    else { cnt += half }

    return cnt
}

extension String {
    subscript(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}