let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var sum = 0
var left = 0
var answer = 0


for right in 0..<inputs[0] {
    sum += numbers[right]
    
    while sum >= inputs[1], left <= right {
        if sum == inputs[1] { answer += 1 } // 경우의 수 + 1
        
        sum -= numbers[left]
        left += 1
    }
}

print(answer)