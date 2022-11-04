import Foundation

func solution(_ numbers:[Int], _ k:Int) -> Int {
    var odd: [Int] = numbers.filter { numbers.firstIndex(of: $0)! % 2 == 0 }
    var event: [Int] = numbers.filter { numbers.firstIndex(of: $0)! % 2 != 0 }
    
    if numbers.count % 2 == 0 {
        return odd[(k - 1) % odd.count]
    } else {
        odd += event
        return odd[(k - 1) % odd.count]
    }
}