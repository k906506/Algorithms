let n = Int(readLine()!)!

for _ in 0..<n {
    let friends = Int(readLine()!)!
    
    var parents = [Int](repeating: 0, count: 2 * friends + 1) // 친구 수는 최대 2 * friends
    var ranks = [Int](repeating: 1, count: 2 * friends + 1)
    var infos = [String: Int]()
    var number = 1
    
    for i in 1...2 * friends {
        parents[i] = i // 자기 자신으로 초기화
    }
    
    for _ in 0..<friends {
        let names = readLine()!.split(separator: " ").map { String($0) }
        
        if infos[names[0]] == nil {
            infos[names[0]] = number
            number += 1
        }
        
        if infos[names[1]] == nil {
            infos[names[1]] = number
            number += 1
        }
        
        unionParent(infos[names[0]]!, infos[names[1]]!, &parents, &ranks)
        
        let root = parents[infos[names[0]]!]
        print(ranks[root])
    }
}

func getParent(_ target: Int, _ parents: inout [Int]) -> Int {
    if parents[target] != target {
        parents[target] = getParent(parents[target], &parents)
    }
    
    return parents[target]
}

func unionParent(_ target1: Int, _ target2: Int, _ parents: inout [Int], _ ranks: inout [Int]) {
    let p1 = getParent(target1, &parents)
    let p2 = getParent(target2, &parents)

    if p1 != p2 {
        parents[p2] = p1
        ranks[p1] += ranks[p2]
    }
}
