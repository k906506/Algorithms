import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var ops = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxValue = Int.min
var minValue = Int.max

func calculate(sum: Int, index: Int) {
    if index == n {
        maxValue = max(sum, maxValue)
        minValue = min(sum, minValue)
        return
    }
    
    for i in 0..<4 {
        if ops[i] > 0 {
            ops[i] -= 1
            switch i {
            case 0:
                calculate(sum: sum + nums[index], index: index + 1)
            case 1:
                calculate(sum: sum - nums[index], index: index + 1)
            case 2:
                calculate(sum: sum * nums[index], index: index + 1)
            default:
                calculate(sum: sum / nums[index], index: index + 1)
            }
            ops[i] += 1
        }
    }
}

calculate(sum: nums[0], index: 1)

print("\(maxValue)\n\(minValue)")
