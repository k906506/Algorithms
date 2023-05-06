let n = Int(readLine()!)!
let m = Int(readLine()!)!

var cities = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    cities[i] = i // 자기 자신으로 초기화
}

for i in 1...n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 1...n {
        if infos[j - 1] == 1 {
            unionParent(i, j)
        }
    }
}

let visitedCities = readLine()!.split(separator: " ").map { Int(String($0))! }

// 방문하려는 도시의 부모 노드가 같다면, 모든 도시들이 연결되어 있는 상태
var result = Set<Int>()

for i in 0..<visitedCities.count {
    result.insert(cities[visitedCities[i]])
}

print(result.count == 1 ? "YES" : "NO")

func getParent(_ target: Int) -> Int {
    if cities[target] != target {
        cities[target] = getParent(cities[target])
    }
    
    return cities[target]
}


func unionParent(_ target1: Int, _ target2: Int) {
    let p1 = getParent(target1)
    let p2 = getParent(target2)
    
    if p1 <= p2 {
        cities[p2] = p1
    } else {
        cities[p1] = p2
    }
}

func findParent(_ target1: Int, _ target2: Int) -> Bool {
    let p1 = getParent(target1)
    let p2 = getParent(target2)
    
    return p1 == p2
}