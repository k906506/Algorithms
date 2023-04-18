let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var right = 0
var count = 0
var answer = Int.max

for left in 0..<inputs[0] {
    while right < inputs[0], count < inputs[1] {
        if numbers[right] == 1 {
            count += 1
        }

        right += 1
    }

    if count == inputs[1] {
        answer = min(answer, right - left)
    }

    if numbers[left] == 1 {
        count -= 1
    }    
}

print(answer == Int.max ? -1 : answer)