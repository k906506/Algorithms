let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

numbers.sort(by: <)

var left = 0
var right = n - 1
var answer = 2147483647

while left < right {
    let sum = numbers[left] + numbers[right]

    if sum > 0 {
        answer = min(answer, abs(sum))
        right -= 1
    } else if sum < 0 {
        answer = min(answer, abs(sum))
        left += 1
    } else {
        answer = 0
        break
    }
}

print(answer)