let s = readLine()!.map { String($0) }
var right = [Int](repeating: 0, count: s.count)

var cnt = 0
for i in stride(from: s.count - 2, to: -1, by: -1) {
    if s[i] == ")", s[i + 1] == ")" {
        cnt += 1
    }

    right[i] = cnt
}

var answer = 0
for i in 0..<s.count - 2 {
    if s[i] == "(", s[i + 1] == "(" {
        answer += right[i + 2]
    }
}

print(answer)