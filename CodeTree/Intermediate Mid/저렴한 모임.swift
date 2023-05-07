let INF = 2147483647

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let targets = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: INF, count: inputs[0] + 1), count: inputs[0] + 1)

for i in 1...inputs[0] {
    graphs[i][i] = 0
}

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    graphs[infos[0]][infos[1]] = infos[2] // 양방향 그래프
    graphs[infos[1]][infos[0]] = infos[2]
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
    answer = min(answer, graphs[targets[0]][i] + graphs[i][targets[1]] + graphs[i][targets[2]])
}

print(answer)