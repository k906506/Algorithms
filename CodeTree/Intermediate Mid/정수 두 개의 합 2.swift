let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = [Int]()

for _ in 0..<infos[0] {
    numbers.append(Int(readLine()!)!)
}

numbers.sort(by: <)

var cnt = 0
var right = infos[0] - 1
for left in 0..<infos[0] {
    // 작거나 같은 경우가 나올 때까지 탐색
    while right >= 0, numbers[left] + numbers[right] > infos[1] {
        right -= 1
    }

    if right <= left {
        break
    }

    cnt += right - left
}

print(cnt)