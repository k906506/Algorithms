let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = [Int]()
var right = inputs[0] - 1
var answer = 0

for _ in 0..<inputs[0] {
    numbers.append(Int(readLine()!)!)
}

numbers.sort(by: <)

for left in 0..<inputs[0] - 1 {
    while right >= 1, numbers[left] + numbers[right] > inputs[1] { // 정수 두 개의 합이 k보다 작아지는 첫 구간을 탐색
        right -= 1
    }

    if right <= left { break } // 범위를 벗어남

    answer += (right - left)
}

print(answer)