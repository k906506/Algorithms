import Foundation

func solution(_ maps:[String]) -> [Int] {
    var boards = maps
    var answer = [Int]()
    
    for i in 0..<boards.count {
        for j in 0..<boards[0].count {
            if boards[i][j] != "X" {
                let result = bfs(i, j, boards)
                boards = result.0
                answer.append(result.1)
            }
        }
    }
    
    if answer.count == 0 {
        answer.append(-1)
    }
    
    return answer.sorted(by: <)
}

func bfs(_ x: Int, _ y: Int, _ boards: [String]) -> ([String], Int) {
    var temp = boards
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    var queue = [[Int]]()
    var cnt = 0
    
    if x >= 0, x < temp.count, y >= 0, y < temp[0].count, temp[x][y] != "X" {
        cnt += Int(temp[x][y])!
        temp[x][y] = "X"
        queue.append([x, y])
    }
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = current[0] + dx[i]
            let ny = current[1] + dy[i]
            
            if nx >= 0, nx < temp.count, ny >= 0, ny < temp[0].count, temp[nx][ny] != "X" {
                cnt += Int(temp[nx][ny])!
                temp[nx][ny] = "X"
                queue.append([nx, ny])
            }
        }
    }
    
    return (temp, cnt)
}

extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
            let range = self.index(self.startIndex, offsetBy: index)..<self.index(self.startIndex, offsetBy: index+1)
            self.replaceSubrange(range, with: newValue)
        }
    }
}
