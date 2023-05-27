let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var maps = [[Int]]()

for _ in 0..<inputs[0] {
    maps.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: inputs[1]), count: inputs[0])
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

let ans = DFS(0, 0)
print(ans)

func DFS(_ x: Int, _ y: Int) -> Int {
    if x == inputs[0] - 1, y == inputs[1] - 1 { return 1 } // 기저
    if dp[x][y] != -1 { return dp[x][y] } // 이미 값을 갖고 있는 경우
    
    dp[x][y] = 0
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0, nx < inputs[0], ny >= 0, ny < inputs[1] {
            if maps[x][y] > maps[nx][ny] { // 다음 방문할 지점이 더 낮은 경우
                dp[x][y] += DFS(nx, ny) // 방문할 수 있는 경우의 수를 추가
            }
        }
    }
    
    return dp[x][y]
}