let INF = 2147483647
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var graphs = [[Int]](repeating: [Int](repeating: INF, count: inputs[0] + 1), count: inputs[0] + 1)

for i in 1...inputs[0] {
    graphs[i][i] = 0
}

for i in 1...inputs[1] {
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

var cnt = 0
var sum = 0
for _ in 0..<inputs[3] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    var dist = INF
    for k in 1...inputs[2] {
        dist = min(dist, graphs[infos[0]][k] + graphs[k][infos[1]])
    }

    if dist < INF {
        cnt += 1
        sum += dist
    }
}

print(cnt)
print(sum)