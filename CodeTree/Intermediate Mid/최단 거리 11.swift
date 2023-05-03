let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: -1, count: infos[0] + 1), count: infos[0] + 1)
var dists = [Int](repeating: 1000001, count: infos[0] + 1)
var visited = [Bool](repeating: false, count: infos[0] + 1)

for _ in 0..<infos[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    graphs[points[0]][points[1]] = points[2]
    graphs[points[1]][points[0]] = points[2]
}

let points = readLine()!.split(separator: " ").map { Int(String($0))! } // 시작, 끝
dists[points[1]] = 0 // 끝점부터 시작

for i in 1...infos[0] { // 모든 정점에 대해 탐색을 진행
    let current = minDistance()
    visited[current] = true // 방문 표시

    for j in 1...infos[0] {
        if graphs[current][j] == -1 { continue } // 존재하지 않는 간선일 경우 패스

        if dists[j] > dists[current] + graphs[current][j] {
            dists[j] = dists[current] + graphs[current][j]
        }
    }
}

print(dists[points[0]])
getPath()

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

func getPath() {
    var current = points[0]
    print(current, terminator: " ")

    while current != points[1] {
        for i in 1...infos[0] {
            if graphs[i][current] == -1 { continue }

            if dists[i] + graphs[i][current] == dists[current] {
                current = i
                break
            }
        }

        print(current, terminator: " ")
    }
}