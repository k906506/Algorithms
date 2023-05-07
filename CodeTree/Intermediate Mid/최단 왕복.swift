let INF = 2147483647
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: INF, count: inputs[0] + 1), count: inputs[0] + 1)

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    graphs[infos[0]][infos[1]] = infos[2]
}

for k in 1...inputs[0] {
    for i in 1...inputs[0] {
        for j in 1...inputs[0] {
            graphs[i][j] = min(graphs[i][j], graphs[i][k] + graphs[k][j])
        }
    }
}

var answer = INF
for i in 1...inputs[0] {
    for j in 1...inputs[0] {
        if i == j { continue }
        answer = min(answer, graphs[i][j] + graphs[j][i])
    }
}

print(answer)