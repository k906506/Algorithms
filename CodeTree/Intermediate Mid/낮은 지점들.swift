let n = Int(readLine()!)!
var infos = [Int: Int]()

for _ in 0..<n {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    if infos[points[0]] == nil {
        infos[points[0]] = points[1]
    } else {
        if infos[points[0]]! > points[1] {
            infos[points[0]] = points[1]
        }
    }
}

print(infos.values.reduce(0, +))