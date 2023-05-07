let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: 0, count: inputs[0] + 1), count: inputs[0] + 1)

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    graphs[infos[0]][infos[1]] = 1
}

for i in 1...inputs[0] {
    graphs[i][i] = 0
}

for k in 1...inputs[0] {
    for i in 1...inputs[0] {
        for j in 1...inputs[0] {
            if graphs[i][k] == 1, graphs[k][j] == 1 {
                graphs[i][j] = 1
            }
        }
    }
}

for i in 1...inputs[0] {
    var cnt = 0

    for j in 1...inputs[0] {
        if i == j { continue }
        if graphs[i][j] == 1 || graphs[j][i] == 1 { continue }
        
        cnt += 1
    }

    print(cnt)
}