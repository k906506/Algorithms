import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [Int]()
    var answer = [Int](repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count {
        while stack.count > 0, numbers[stack.last!] < numbers[i] {
            answer[stack.removeLast()] = numbers[i]
        }
        stack.append(i)
    }
    
    return answer
}