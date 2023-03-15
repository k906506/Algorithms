let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

numbers.sort()

var start = 0
var end = numbers.count - 1
var goal = Int.max
var answer = [Int]()

while start < end {
    let sum = numbers[start] + numbers[end]
    
    if sum == 0 {
        answer = [numbers[start], numbers[end]]
        break
    }
    
    if abs(sum) < goal {
        goal = abs(sum)
        answer = [numbers[start], numbers[end]]
    }
    
    if sum < 0 { start += 1 }
    else { end -= 1 }
}


print(answer[0], answer[1])