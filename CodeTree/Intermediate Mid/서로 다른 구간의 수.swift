let n = Int(readLine()!)!
var points = [[Int]]()

for _ in 0..<n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    points.append([infos[0], 1])
    points.append([infos[1], -1])
}

points.sort(by: { $0[0] > $1[0] })

var count = 0
var sum = 0

while !points.isEmpty {
    let point = points.removeLast()

    if sum == 0 {
        count += 1
    }

    sum += point[1]
}

print(count)