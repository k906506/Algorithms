let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var counts = [Int](repeating: 0, count: 100001)

var left = 0
var right = 0
var result = 0

while true {
    if right == info[0] {
        result = max(right - left, result)
        break
    }
    
    if counts[numbers[right]] >= info[1] { // K가 넘어가면 left 재조정
        result = max(right - left, result)
        
        while counts[numbers[right]] >= info[1], left <= right {
            counts[numbers[left]] -= 1
            left += 1
        }
    } else {
        counts[numbers[right]] += 1
        right += 1
    }
}

print(result)