import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }

var nums: [Int] = []
var answer = ""

backTracking()
print(answer)

func backTracking() {
    if nums.count == input[1] {
        answer += nums.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }
    
    for i in 1...input[0] {
        nums.append(i)
        backTracking()
        nums.removeLast()
    }
}