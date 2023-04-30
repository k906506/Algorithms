let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = Int.min
var sum = 0

for number in numbers {
    sum += number
    answer = max(answer, sum)

    if sum < 0 {
        sum = 0 // sum 초기화
    }
}

print(answer)