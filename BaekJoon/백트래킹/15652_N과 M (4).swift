import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }

var nums: [Int] = []
var answer = ""

backTracking(1)
print(answer)

func backTracking(_ index: Int) {
    if nums.count == input[1] {
        answer += nums.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }
    
    for i in index..<(input[0] + 1) {
        nums.append(i)
        backTracking(i)
        nums.removeLast()
    }
}