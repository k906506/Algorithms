let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var words = [[String]]()
var arr = [Int]()
var result = 0

for _ in 0..<inputs[0] * 2 {
    words.append(readLine()!.map { String($0) })
}

for i in 0..<inputs[1] - 2 {
    for j in i + 1..<inputs[1] - 1 {
        for k in j + 1..<inputs[1] {
            result += verify([i, j, k]) ? 1 : 0
        }
    }
}

print(result)

func verify(_ arr: [Int]) -> Bool {
    var setA = Set<String>()

    for i in 0..<(words.count / 2) {
        setA.insert(words[i][arr[0]] + words[i][arr[1]] + words[i][arr[2]])
    }

    // 같은 원소가 있으면 false를 반환 -> 탐색 종료
    for i in (words.count / 2)..<words.count {
        if setA.contains(words[i][arr[0]] + words[i][arr[1]] + words[i][arr[2]]) {
            return false
        }
    }

    return true
}