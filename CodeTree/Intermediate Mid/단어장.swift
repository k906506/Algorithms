let n = Int(readLine()!)!
var infos = [String: Int]()

for _ in 0..<n {
    let word = String(readLine()!)

    if infos[word] == nil {
        infos[word] = 1
    } else {
        infos[word] = infos[word]! + 1
    }
}

var arr = Array(zip(infos.keys, infos.values))
arr.sort(by: { $0.0 < $1.0 })
arr.forEach { print("\($0) \($1)") }