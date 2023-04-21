let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var infos = [[Int]](repeating: [0, 0, 0], count: inputs[0] + 1)

for i in 1...inputs[0] {
    let number = Int(readLine()!)!

    infos[i][number - 1] += 1
}

for i in 1...inputs[0] {
    for j in 0..<3 {
        infos[i][j] += infos[i - 1][j]
    }
}

for i in 0..<inputs[1] {
    let orders = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 0..<3 {
        print(infos[orders[1]][j] - infos[orders[0] - 1][j], terminator: " ")
    }

    print()
}