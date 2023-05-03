// n <= 1000이므로 O(n^2)도 가능

let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: 100001, count: infos[0] + 1), count: infos[0] + 1)
var dists = [Int](repeating: 1000001, count: infos[0] + 1)
var visited = [Bool](repeating: false, count: infos[0] + 1)

for _ in 0..<infos[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    graphs[points[0]][points[1]] = min(graphs[points[0]][points[1]], points[2])
    graphs[points[1]][points[0]] = min(graphs[points[0]][points[1]], points[2])
}

let points = readLine()!.split(separator: " ").map { Int(String($0))! } // 시작, 끝
dists[points[0]] = 0

for i in 1...infos[0] { // 모든 정점에 대해 탐색을 진행
    let current = minDistance()
    visited[current] = true // 방문 표시

    for j in 1...infos[0] {
        if graphs[current][j] == 100001 { continue } // 존재하지 않는 간선일 경우 패스

        if dists[j] > dists[current] + graphs[current][j] {
            dists[j] = dists[current] + graphs[current][j]
        }
    }
}

print(dists[points[1]])

// 최소 거리를 가진 인덱스를 반환하는 메서드
func minDistance() -> Int {
    var index = 0

    for i in 1...infos[0] {
        if visited[i] { continue } // 이미 방문한 정점이면 패스

        if dists[i] != 100001, dists[index] > dists[i] {
            index = i
        }
    }

    return index
}