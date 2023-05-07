let INF = 2147483647
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: INF, count: inputs[0] + 1), count: inputs[0] + 1)

for i in 1...inputs[0] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 1...inputs[0] {
        if i == j {
            graphs[i][j] = 0
        } else {
            graphs[i][j] = infos[j - 1]
        }
    }
}

for k in 1...inputs[0] {
    for i in 1...inputs[0] {
        for j in 1...inputs[0] {
            graphs[i][j] = min(graphs[i][j], graphs[i][k] + graphs[k][j])
        }
    }
}

for _ in 0..<inputs[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    print(graphs[points[0]][points[1]])
}