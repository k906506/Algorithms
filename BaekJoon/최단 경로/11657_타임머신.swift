// 도시(정점) 500개, 버스 노선(간선) 6000개이므로, 3000000 <= 1억
let INF = Int(1e9)

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var infos = [[Int]]()
var visited = [Bool](repeating: false, count: inputs[0] + 1)
var dists = [Int](repeating: INF, count: inputs[0] + 1)

for _ in 0..<inputs[1] {
    infos.append(readLine()!.split(separator: " ").map { Int(String($0))! }) // 시작, 도착, 시간
}

dists[1] = 0 // 시작
var hasCycle = false

for i in 0..<inputs[0] { // 모든 정점에 대해
    for j in 0..<inputs[1] { // 모든 간선에 대해
        let info = infos[j]
        
        let src = info[0]
        let dst = info[1]
        let dist = info[2]
        
        // 현재 노드까지의 최단 거리가 INF라면, 다음 노드도 INF이므로 탐색할 필요 없음
        if dists[src] != INF, dists[dst] > dists[src] + dist {
            dists[dst] = dists[src] + dist
            
            if i == inputs[0] - 1 {
                hasCycle = true
                break
            }
        }
    }
}

if hasCycle {
    print(-1)
} else {
    for i in 2...inputs[0] {
        print(dists[i] == INF ? -1 : dists[i])
    }
}