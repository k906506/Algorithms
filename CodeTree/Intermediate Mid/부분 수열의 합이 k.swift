let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var right = 0
var sum = 0
var cnt = 0

for left in 0..<inputs[0] {
    while right < inputs[0], sum < inputs[1] {
        sum += numbers[right]
        right += 1
    }

    if sum == inputs[1] {
        cnt += 1
    }

    sum -= numbers[left]
}

print(cnt)