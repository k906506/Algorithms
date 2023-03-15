let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let goal = Int(readLine()!)!

numbers.sort()

var start = 0
var end = numbers.count - 1
var cnt = 0

while start < end {
    let sum = numbers[start] + numbers[end]

    if sum > goal {
        end -= 1
    } else if sum < goal {
        start += 1
    } else {
        cnt += 1
        
        start += 1
        end -= 1
    }
}

print(cnt)