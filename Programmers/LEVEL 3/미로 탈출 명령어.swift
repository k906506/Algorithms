let dx = [1, 0, 0, -1] // 하, 좌, 우, 상
let dy = [0, -1, 1, 0]
let ds = ["d", "l", "r", "u"]
var answer = "z"

func solution(_ n: Int, _ m: Int, _ x: Int, _ y: Int, _ r: Int, _ c: Int, _ k: Int) -> String {
    if isNotReachable(x, y, r, c, k) { // 최소 이동 거리로 도달할 수 없을 때
        return "impossible"
    }

    dfs(n, m, x, y, r, c, "", 0, k)

    return answer
}

func dfs(_ n: Int, _ m: Int, _ x: Int, _ y: Int, _ r: Int, _ c: Int, _ path: String, _ depth: Int, _ k: Int) {
    if k - depth < abs(x - r) + abs(y - c) { // 최소 이동 거리로 도달할 수 없을 때
        return
    }

    if x == r && y == c && depth == k {
        answer = path
        return
    }

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if isMovable(nx, ny, n, m), path < answer {
            dfs(n, m, nx, ny, r, c, path + ds[i], depth + 1, k)
        }
    }
}

func isMovable(_ nx: Int, _ ny: Int, _ n: Int, _ m: Int) -> Bool {
    return nx >= 1 && nx <= n && ny >= 1 && ny <= m
}

func isNotReachable(_ x: Int, _ y: Int, _ r: Int, _ c: Int, _ k: Int) -> Bool {
    return abs(x - r) + abs(y - c) > k || (k - abs(x - r) - abs(y - c)) % 2 == 1
}