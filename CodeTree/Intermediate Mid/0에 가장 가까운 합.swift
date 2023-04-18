let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

numbers.sort(by: <)

var answer = Int.max
var left = 0
var right = n - 1

while left < right {
    let sum = numbers[left] + numbers[right]

    if sum > 0 {
        answer = min(answer, abs(numbers[left] + numbers[right]))
        right -= 1
    } else if sum < 0 {
        answer = min(answer, abs(numbers[left] + numbers[right]))
        left += 1
    } else {
        answer = 0
        break
    }
}

print(answer)