let a = readLine()!.map { String($0) }
let b = readLine()!.map { String($0) }
let orders = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = a.count
var answer = -1

while left <= right {
    let mid = (left + right) / 2

    if isPossible(mid) {
        answer = max(answer, mid)
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer + 1)

func isPossible(_ mid: Int) -> Bool {
    var pass = [Bool](repeating: false, count: a.count)

    for i in 0..<mid { // 제거했다고 가정
        pass[orders[i] - 1] = true
    }

    var right = 0

    for left in 0..<a.count {
        if pass[left] { continue }

        if right < b.count, a[left] == b[right] {
            right += 1
        }
    }

    return right == b.count // 끝점에 도달한 경우 부분수열이 맞음
}