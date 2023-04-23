let n = Int(readLine()!)!
var points = [[Int]]()

for _ in 0..<n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    points.append([infos[0], 1])
    points.append([infos[1], -1])
}

points.sort(by: { $0[0] > $1[0] })

var count = 0 
var answer = 0
while !points.isEmpty {
    let point = points.removeLast()

    count += point[1]
    answer = max(answer, count)
}

print(answer)