let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var roots = [Int](repeating: 0, count: inputs[0] + 1)
var dists = [[Int]]()
var ans = 0

func configRoots() {
    for i in 1...inputs[0] {
        roots[i] = i
    }
}

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

configRoots() // root 테이블 초기화

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    dists.append([infos[2], infos[0], infos[1]])
}

dists.sort(by: { $0[0] > $1[0] }) // 가중치의 내림차순으로 정렬 -> 원래는 오름차순인데 removeLast를 위해 내림차순으로

while !dists.isEmpty {
    let current = dists.removeLast()
    
    if !findParent(current[1], current[2]) { // 사이클을 형성하는지 확인
        unionParent(current[1], current[2])
        ans += current[0]
    }
}

print(ans)
