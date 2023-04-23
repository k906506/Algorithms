let n = Int(readLine()!)!
let s = readLine()!.map { String($0) }

var left = [Int](repeating: 0, count: n)
var right = [Int](repeating: 0, count: n)

var cnt = 0
for i in 0..<n {
    if s[i] == "C" {
        cnt += 1
    }

    left[i] = cnt
}

cnt = 0
for i in stride(from: n - 1, to: -1, by: -1) {
    if s[i] == "W" {
        cnt += 1
    }

    right[i] = cnt
}

var answer = 0
for i in 1..<n - 1 {
    if s[i] == "O" {
        answer += left[i - 1] * right[i + 1]
    }
}

print(answer)