import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = 2147483647
    var parents = [Int](repeating: 0, count: n + 1)
        
    for i in 0..<n {
        parents[i + 1] = i + 1
    }
    
    for passIdx in 0..<wires.count {
        var tempParents = parents
        
        for idx in 0..<wires.count {
            if idx == passIdx { continue }
            
            unionParent(&tempParents, wires[idx][0], wires[idx][1])
        }
        
        var counts = [Int: Int]()
        
        for idx in 1...n {
            let temp = getParent(&tempParents, tempParents[idx])
            
            if counts[temp] == nil {
                counts[temp] = 1
            } else {
                counts[temp] = counts[temp]! + 1
            }
        }
        
        let sortedCounts = counts.values.sorted(by: >)
        answer = min(answer, abs(sortedCounts[0] - sortedCounts[1]))
    }
    
    return answer
}

func getParent(_ parents: inout [Int], _ node: Int) -> Int {
    if parents[node] != node {
        parents[node] = getParent(&parents, parents[node])
    }
    
    return parents[node]
}

func unionParent(_ parents: inout [Int], _ nodeA: Int, _ nodeB: Int) {
    let p1 = getParent(&parents, nodeA)
    let p2 = getParent(&parents, nodeB)
    
    if p1 < p2 {
        parents[p2] = p1
    } else {
        parents[p1] = p2
    }
}