import Foundation

func solution(_ numbers:[Int]) -> Int {
    var maxValue: Int = Int.min
    
    for i in 0..<numbers.count - 1 {
        for j in (i + 1)..<numbers.count {
            if maxValue <= numbers[i] * numbers[j] {
                maxValue = numbers[i] * numbers[j]
            }
        }
    }
    
    return maxValue
}
