let n = Int(readLine()!)!
var infos = [String: Int]()

for _ in 0..<n {
    let arr = readLine()!.map { String($0) }
    let word = arr.sorted(by: <).joined(separator: "")

    if infos[word] != nil {
        infos[word] = infos[word]! + 1
    } else {
        infos[word] = 1
    }
}

print(infos.values.max()!)