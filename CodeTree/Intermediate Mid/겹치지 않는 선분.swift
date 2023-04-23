let n = Int(readLine()!)!
var lines = [[Int]]()

for _ in 0..<n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    lines.append(infos)
}

lines.sort(by: { $0[0] < $1[0] }) // 첫 번째 원소에 대해 오름차순으로 정렬

var left = [Int](repeating: 0, count: n)
var right = [Int](repeating: 0, count: n)

// left에는 최대 값이 들어있음
left[0] = lines[0][1]
for i in 1..<n {
    left[i] = max(left[i - 1], lines[i][1])
}

// right에는 최소 값이 들어있음
right[n - 1] = lines[n - 1][1]
for i in stride(from: n - 2, to: -1, by: -1) {
    right[i] = min(right[i + 1], lines[i][1])
}

var answer = 0
for i in 0..<n {
    if i > 0, left[i - 1] >= lines[i][1] { // 왼쪽 선분과 겹치는 경우
        continue
    }

    if i < n - 1, right[i + 1] <= lines[i][1] { // 오른쪽 선분과 겹치는 경우
        continue
    }

    answer += 1
}

print(answer)