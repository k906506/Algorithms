let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var counting = [Int](repeating: 0, count: 100001)
var right = 0
var answer = 0

for left in 0..<n {
    while right < n, counting[numbers[right]] == 0 { // 진행할 수 없을 때까지 우측 포인터를 이동
        counting[numbers[right]] = 1
        answer = max(answer, right - left + 1)
        right += 1
    }

    counting[numbers[left]] = 0 // 좌측 포인터를 이동
}

print(answer)
