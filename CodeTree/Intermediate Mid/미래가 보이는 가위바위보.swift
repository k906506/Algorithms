let n = Int(readLine()!)!
var infos = [String]()
var left = [Int](repeating: 0, count: n)
var right = [Int](repeating: 0, count: n)
let shape = ["S", "H", "P"]

for _ in 0..<n {
    infos.append(String(readLine()!))
}

for i in 0..<3 {
    var cnt = 0

    for j in 0..<n {
        if infos[j] == shape[((i + 3) - 1) % 3] { // A가 이기는 경우
            cnt += 1
        }

        left[j] = max(left[j], cnt)
    }
}

for i in 0..<3 {
    var cnt = 0

    for j in stride(from: n - 1, to: -1, by: -1) {
        if infos[j] == shape[((i + 3) - 1) % 3] { // A가 이기는 경우
            cnt += 1
        }

        right[j] = max(right[j], cnt)
    }
}

var answer = 0
for i in 0..<n - 1 {
    answer = max(answer, left[i] + right[i + 1])
}

print(answer)