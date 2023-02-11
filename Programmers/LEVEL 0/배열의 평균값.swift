import Foundation

func solution(_ numbers:[Int]) -> Double {
    var sum: Int = 0
    
    numbers.forEach { sum += $0 }
    
    return Double(sum) / Double(numbers.count)
}
