import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    var abstract: [Int] = array.sorted().map { abs($0 - n) }
    var minValue: Int = Int.max
    var index: Int = 0

    for i in 0..<abstract.count {
        if minValue > abstract[i] {
            minValue = abstract[i]
            index = i
        }
    }

    return array.sorted()[index]
}