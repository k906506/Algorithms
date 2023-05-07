import Foundation

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var parents = [Int](repeating: 0, count: inputs[0])
var stage = 1

for i in 0..<inputs[0] {
    parents[i] = i // 일단 자기 자신으로 초기화
}

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    // 우선 사이클이 생성되는지 판단
    if findParent(infos[0], infos[1]) { // 사이클이 생성
        print(stage)
        exit(0)
    } else { // 사이클이 생성되지 않으므로 Union
        unionParent(infos[0], infos[1])
    }
    
    stage += 1
}

print(0)

func getParent(_ target: Int) -> Int {
    if parents[target] != target {
        parents[target] = getParent(parents[target])
    }
    
    return parents[target]
}

func unionParent(_ target1: Int, _ target2: Int) {
    let p1 = getParent(target1)
    let p2 = getParent(target2)
    
    if p1 <= p2 {
        parents[p2] = p1
    } else {
        parents[p1] = p2
    }
}

func findParent(_ target1: Int, _ target2: Int) -> Bool {
    let p1 = getParent(target1)
    let p2 = getParent(target2)
    
    return p1 == p2
}