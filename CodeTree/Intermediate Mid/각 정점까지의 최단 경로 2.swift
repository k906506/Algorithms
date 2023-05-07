let INF = 2147483647
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: INF, count: inputs[0] + 1), count: inputs[0] + 1)

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    graphs[infos[0]][infos[1]] = min(infos[2], graphs[infos[0]][infos[1]])
}

for k in 1...inputs[0] {
    for i in 1...inputs[0] {
        for j in 1...inputs[0] {
            if i != j {
                graphs[i][j] = min(graphs[i][j], graphs[i][k] + graphs[k][j])
            } else {
                graphs[i][i] = 0
            }
        }
    }
}

for i in 1...inputs[0] {
    for j in 1...inputs[0] {
        print(graphs[i][j] == INF ? -1 : graphs[i][j], terminator: " ")
    }

    print()
}