let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var infos = [Int](repeating: 0, count: inputs[0] + 1)
var sets = [Set<Int>](repeating: [], count: inputs[0] + 1)
var orders = [[Int]]()

for i in 1...inputs[0] {
    infos[i] = i
    sets[i] = [i]
}

for _ in 0..<inputs[1] {
    orders.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<inputs[1] * 3 {
    let order = orders[i % inputs[1]] // 변경할 인덱스에 대한 정보

    let e1 = infos[order[0]] // 변경할 값
    let e2 = infos[order[1]] // 변경할 값
    
    sets[e1].insert(order[1])
    sets[e2].insert(order[0])

    infos.swapAt(order[0], order[1])
}

sets[1..<sets.count].forEach { print($0.count) }