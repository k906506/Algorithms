let n = Int(readLine()!)!
var counts = [[Int]]()

for _ in 0..<n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    counts.append([infos[0], 1])
    counts.append([infos[1], -1])
}

counts.sort(by: { $0[0] > $1[0] })

var count = 0
var sum = 0

while !counts.isEmpty {
    let position = counts.removeLast()

    count += position[1]
    sum = max(sum, count)
}

print(sum)