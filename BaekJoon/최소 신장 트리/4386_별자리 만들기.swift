// 별의 개수 100개
// 별들을 잇는 간선의 개수 100^2 = 10000개
import Foundation

let n = Int(readLine()!)!
var stars = [[Float]]()
var roots = [Int](repeating: 0, count: n + 1)
var dists: [(Float, Int, Int)] = []

func getParent(_ current: Int) -> Int {
    if roots[current] != current {
        roots[current] = getParent(roots[current])
    }
    
    return roots[current]
}

func unionParent(_ left: Int, _ right: Int) {
    let p1 = getParent(left)
    let p2 = getParent(right)
    
    if p1 < p2 {
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

// 두 별 사이의 거리를 계산하는 메서드
func getDistance(_ x1: Float, _ y1: Float, _ x2: Float, _ y2: Float) -> Float {
    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2))
}

for i in 1...n {
    roots[i] = i
}

for _ in 0..<n {
    stars.append(readLine()!.split(separator: " ").map { Float(String($0))! })
}

// 모든 별 사이의 거리를 계산
for i in 1..<n {
    for j in i + 1...n {
        let dist = getDistance(stars[i - 1][0], stars[i - 1][1], stars[j - 1][0], stars[j - 1][1])
        dists.append((dist, i, j))
    }
}

dists.sort(by: { $0.0 > $1.0 }) // removeLast를 위해 내림차순으로 정렬

var ans: Float = 0

while !dists.isEmpty {
    let current = dists.removeLast()
    
    if !findParent(current.1, current.2) {
        unionParent(current.1, current.2)
        ans += current.0
    }
}

print(round(ans * 100) / 100)
