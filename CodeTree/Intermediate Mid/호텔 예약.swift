let n = Int(readLine()!)!
var infos = [[Int]]()

for _ in 0..<n {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    infos.append([points[0], 1])
    infos.append([points[1], -1])
}

infos.sort(by: { $0[0] > $1[0] })

var count = 0
var answer = 0

while !infos.isEmpty {
    let points = infos.removeLast()

    count += points[1]
    answer = max(answer, count)
}

print(answer)