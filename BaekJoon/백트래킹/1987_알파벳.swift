let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var boards = [[Int]]()
var ans = 0

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// 문자열 저장
for _ in 0..<inputs[0] {
    let arr = readLine()!.map { Int(UnicodeScalar(String($0))!.value) - 65 }
    boards.append(arr)
}

dfs(0, 0, 1, 1 << boards[0][0])
print(ans)

// 백트래킹
func dfs(_ x: Int, _ y: Int, _ cnt: Int, _ alphabet: Int) {
    ans = max(ans, cnt) // 결과 값 갱신
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0, nx < inputs[0], ny >= 0, ny < inputs[1] {
            let next = 1 << boards[nx][ny]
            
            if alphabet & next == 0 {
                dfs(nx, ny, cnt + 1, alphabet | next)
            }
        }
    }
}

// 실패한 코드
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var boards = [[Int]]()
var visited = [Int](repeating: 0, count: 26)
var ans = 0

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// 문자열 저장
for _ in 0..<inputs[0] {
    let arr = readLine()!.map { Int(UnicodeScalar(String($0))!.value) - 65 }
    boards.append(arr)
}

visited[boards[0][0]] = 1 // 시작 지점 방문 여부 체크
dfs(0, 0, 1)
print(ans)

// 백트래킹
func dfs(_ x: Int, _ y: Int, _ cnt: Int) {
    ans = max(ans, cnt) // 결과 값 갱신
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0, nx < inputs[0], ny >= 0, ny < inputs[1] {
            if visited[boards[nx][ny]] == 0 { // 다음 알파벳이 아직 방문하지 않은 경우에만 DFS 진행
                visited[boards[nx][ny]] = 1 // 방문 여부 체크
                dfs(nx, ny, cnt + 1)
                visited[boards[nx][ny]] = 0 // 방문 여부 체크 해제
            }
        }
    }
}