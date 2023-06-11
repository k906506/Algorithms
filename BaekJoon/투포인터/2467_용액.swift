// 산성 용액과 알칼리성 용액이 정렬된 상태로 주어짐
let n = Int(readLine()!)!
let liquids = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = liquids.count - 1
var goal = Int.max
var answer = ""

while left < right {
    let sum = liquids[left] + liquids[right]
    
    if sum == 0 {
        answer = "\(liquids[left]) \(liquids[right])"
        break
    }
    
    if abs(sum) < goal {
        goal = abs(sum)
        answer = "\(liquids[left]) \(liquids[right])"
    }
    
    if sum < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(answer)