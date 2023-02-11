import Foundation

func solution(_ grid:[String]) -> [Int] {
    var result = [Int]()
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 4), count: grid[0].count), count: grid.count)
    
    let row = grid.count
    let col = grid[0].count
    
    let dxdy = [[-1, 0], [0, 1], [1, 0], [0, -1]] // 0, 1, 2, 3
    
    for i in 0..<row {
        for j in 0..<col {
            for k in 0..<4 {
                if !visited[i][j][k] { // 방문하지 않았을 때만
                    var cnt = 0
                    
                    var nx = i
                    var ny = j
                    var nd = k
                    
                    while !visited[nx][ny][nd] {
                        visited[nx][ny][nd] = true
  
                        nd = setDirection(nd, grid[nx][ny])  
                        let next = setPoint(nx, ny, row, col, dxdy[nd])

                        nx = next[0]
                        ny = next[1]
                        
                        cnt += 1
                    }
                    
                    if cnt != 0 {
                        result.append(cnt)
                    }
                }  
            }
        }
    }
    
    return result.sorted(by: <)
}

/// 이동할 좌표의 다음 방향을 설정하는 메서드
func setDirection(_ direction: Int, _ type: String) -> Int {
    if type == "S" {
        return direction
    } else if type == "L" { // 좌회전
        return direction - 1 < 0 ? 3 : direction - 1
    } else { // 우회전
        return direction + 1 > 3 ? 0 : direction + 1
    }
}

/// 이동할 좌표를 설정하는 메서드
func setPoint(_ x: Int, _ y: Int, _ row: Int, _ col: Int, _ direction: [Int]) -> [Int] {
    var nx = x + direction[0]
    var ny = y + direction[1]
    
    if nx < 0 { nx = row - 1 }
    if nx >= row { nx = 0 }
    if ny < 0 { ny = col - 1 }
    if ny >= col { ny = 0 }
    
    return [nx, ny]
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

/* 처음 시도했던 방법
func solution(_ grid:[String]) -> [Int] {
    var result = [Int]()
    var paths = [String: Int]() // 경로를 저장할 딕셔너리
    
    let row = grid.count
    let col = grid[0].count
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    var queue = [[Int]]()
    
    for i in 0..<1 {
        for j in 0..<1{
            for k in 0..<4 {
                var visited = [[Int]](repeating: [Int](repeating: 0, count: grid[0].count), count: grid.count) // 방문 횟수를 카운트
                var cnt = 0
                
                queue.append([i, j, dx[k], dy[k]])
                
                while !queue.isEmpty {
                    let current = queue.removeFirst()
                    
                    // 이동할 좌표 설정
                    let next = setPoint(current[0], current[1], row, col, [current[2], current[3]])
                    // print("next \(next)")
                    
                    // 이동할 좌표의 다음 방향을 설정
                    let nextDirection = setDirection([current[2], current[3]], grid[next[0]][next[1]])
                    // print("nextDirection \(nextDirection)")
                    
                    // 경로를 저장
                    let path = "\(current[0])\(current[1])\(current[2])\(current[3]) -> \(next[0])\(next[1])\(nextDirection[0])\(nextDirection[1])"
                    
                    if paths[path] == nil {
                        paths[path] = 0 // 경로 저장
                        
                        visited[current[0]][current[1]] -= 1 // 현재 좌표에 -1
                        visited[next[0]][next[1]] += 1 // 이동할 좌표에 +1
                        
                        queue.append([next[0], next[1], nextDirection[0], nextDirection[1]])     
                        cnt += 1
                    } else { // 이미 지나간 경로가 있다면 사이클 발생
                        if cnt != 0 { // 경로 저장
                            result.append(cnt)
                        }
                        
                        break
                    }
                }
            }
        }
    }
    
    return result.sorted(by: <)
}

/// 이동할 좌표를 설정하는 메서드
func setPoint(_ x: Int, _ y: Int, _ row: Int, _ col: Int, _ direction: [Int]) -> [Int] {
    var nx = x + direction[0]
    var ny = y + direction[1]
    
    if nx < 0 { nx = row - 1 }
    if nx >= row { nx = 0 }
    if ny < 0 { ny = col - 1 }
    if ny >= col { ny = 0 }
    
    return [nx, ny]
}

/// 이동한 좌표의 다음 방향을 설정하는 메서드
func setDirection(_ direction: [Int], _ type: String) -> [Int] {
    if type == "S" {
        return direction
    } else if type == "L" { // 좌회전
        if direction[0] == -1, direction[1] == 0 {
            return [0, -1]
        } else if direction[0] == 0, direction[1] == 1 {
            return [-1, 0]
        } else if direction[0] == 1, direction[1] == 0 {
            return [0, 1]
        } else {
            return [1, 0]
        }
    } else { // 우회전
        if direction[0] == -1, direction[1] == 0 {
            return [0, 1]
        } else if direction[0] == 0, direction[1] == 1 {
            return [1, 0]
        } else if direction[0] == 1, direction[1] == 0 {
            return [0, -1]
        } else {
            return [-1, 0]
        }
    }
}

func checkInputOutput(_ visited: [[Int]]) -> Bool {
    let standard = visited[0][0]
    
    for i in 0..<visited.count {
        for j in 0..<visited[0].count {
            if visited[i][j] != standard {
                return false
            }
        }
    }
    
    return true
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
*/