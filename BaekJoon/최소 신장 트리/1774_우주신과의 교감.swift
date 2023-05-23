import Foundation

// 4 1
// 1 1
// 3 1
// 2 3
// 4 3
// 1 4

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var points = [[Int]]()
var roots = [Int](repeating: 0, count: inputs[0] + 1)
var dists = [(Double, Int, Int)]()
// var alreadys  = [[Int]]() // 이미 연결된 노드들

func getParent(_ current: Int) -> Int {
    if roots[current] != current {
        roots[current] = getParent(roots[current])
    }
    
    return roots[current]
}

func unionParent(_ left: Int, _ right: Int) {
    let p1 = getParent(left)
    let p2 = getParent(right)
    
    if p1 < p2 { // 더 작은 쪽을 부모로 변경
        roots[p2] = p1
    } else {
        roots[p1] = p2
    }
}

func findParent(_ left: Int, _ right: Int) -> Bool {
    let p1 = getParent(left)
    let p2 = getParent(right)
    
    return p1 == p2
}

func configRoots() {
    for i in 1...inputs[0] {
        roots[i] = i
    }
}

func getDistance(_ p1: [Int], _ p2: [Int]) -> Double {
    return sqrt(pow(Double(p1[0] - p2[0]), 2) + pow(Double(p1[1] - p2[1]), 2))
}

configRoots() // root 테이블 초기화

for _ in 0..<inputs[0] {
    points.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for _ in 0..<inputs[1] {
    let alreadys = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    unionParent(alreadys[0], alreadys[1]) // 이미 연결된 통로
}

for i in 1..<inputs[0] {
    for j in i + 1...inputs[0] {
        let dist = getDistance(points[i - 1], points[j - 1])
        dists.append((dist, i, j))
    }
}

dists.sort(by: { $0.0 > $1.0 })

var ans: Double = 0

while !dists.isEmpty {
    let current = dists.removeLast()
    
    if !findParent(current.1, current.2) {
        unionParent(current.1, current.2)
        ans += current.0
    }
}

ans = round(ans * 100) / 100

if String(ans).split(separator: ".")[1].count < 2 {
    print(String(ans) + "0")
} else {
    print(ans)
}
