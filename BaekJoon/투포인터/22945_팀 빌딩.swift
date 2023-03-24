let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = n - 1
var result = 0

while left < right {
    result = max(result, (right - left - 1) * min(numbers[left], numbers[right]))
    
    // 더 작은 값의 index를 이동
    if numbers[left] > numbers[right] {
        right -= 1
    } else {
        left += 1
    }
}

print(result)