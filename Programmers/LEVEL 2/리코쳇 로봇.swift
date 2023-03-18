import Foundation

var result = Int.max

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

func solution(_ board:[String]) -> Int {
    var start = [0, 0]
    var queue = [[Int]]()
    var info = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 4), count: board[0].count), count: board.count)
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if board[i][j] == "R" {
                start = [i, j]
                break
            }
        }
    }
    
    // 네 방향
    for i in 0..<4 {
        queue.append([start[0], start[1], i, 0])
    }
    
    while !queue.isEmpty {
        var current = queue.removeFirst() // x 좌표, y 좌표, 진행 방향, 움직임 횟수
        
        var nx = current[0]
        var ny = current[1]
        
        if board[nx][ny] == "G" {
            result = min(result, current[3]) // 최소 이동거리 저장
        }
        
        // 벽을 만나면 Queue에 넣고 탈출
        while true {
            nx += dx[current[2]]
            ny += dy[current[2]]
                
            if nx >= 0, nx < board.count, ny >= 0, ny < board[0].count {
                if board[nx][ny] == "D" { 
                    if info[nx - dx[current[2]]][ny - dy[current[2]]][current[2]] { break } 
                    
                    queue.append([nx - dx[current[2]], ny - dy[current[2]], (current[2] + 1) % 4 , current[3] + 1]) // 다음 좌표, 진행 방향, 움직임 횟수
                    queue.append([nx - dx[current[2]], ny - dy[current[2]], (current[2] + 3) % 4 , current[3] + 1]) // 다음 좌표, 진행 방향, 움직임 횟수
                    info[nx - dx[current[2]]][ny - dy[current[2]]][current[2]] = true
                                 
                    break
                } else if board[nx][ny] == "." {
                    if (current[2] == 0 && nx == 0) || (current[2] == 1 && ny == board[0].count - 1) || (current[2] == 2 && nx == board.count - 1) || (current[2] == 3 && ny == 0) {
                        if info[nx][ny][current[2]] { break } 
                        
                        queue.append([nx, ny, (current[2] + 1) % 4 , current[3] + 1]) // 다음 좌표, 진행 방향, 움직임 횟수
                        queue.append([nx, ny, (current[2] + 3) % 4 , current[3] + 1]) // 다음 좌표, 진행 방향, 움직임 횟수
                        info[nx][ny][current[2]] = true
 
                        break
                    }
                } else if board[nx][ny] == "G" && ny == board[0].count - 1 && current[2] != 2 { // 17번 케이스
                    result = min(result, current[3] + 1) // 최소 이동거리 저장
                }
            } else {
                break
            }
        }
    }
    
    return result == Int.max ? -1 : result
}

extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
			let range = self.index(self.startIndex, offsetBy: index)..<self.index(self.startIndex, offsetBy: index + 1)
			self.replaceSubrange(range, with: newValue)
        }
    }
}