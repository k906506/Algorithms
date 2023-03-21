let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = 0
var cnt = 0
var result = 0

while true {
    if cnt <= info[1] { // 제거할 수 있는 경우
        result = max(result, right - left - cnt)
        if right == info[0] { break }
        else {
            if numbers[right] % 2 != 0 {
                cnt += 1
            }
            
            right += 1
        }
    } else { // 제거할 수 없는 경우 - left 이동
        result = max(result, (right - 2) - left - info[1])
        
        while true {
            if cnt <= info[1] { break }
            
            if numbers[left] % 2 != 0 { // 홀수인 경우
                cnt -= 1
            }
            
            left += 1
        }
    }
}

print(result)