let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var sum = 0
var answer = 100001

for right in 0..<inputs[0] {
    sum += numbers[right]
    
    while sum >= inputs[1], left <= right {
        answer = min(answer, right - left + 1)
        
        // 좌측 포인터를 한 칸씩 이동
        sum -= numbers[left]
        left += 1
    }
}

print(answer == 100001 ? -1 : answer)
