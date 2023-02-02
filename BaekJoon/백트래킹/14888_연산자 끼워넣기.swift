import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))!}
var ops = readLine()!.split(separator: " ").map { Int(String($0))!}

var maxValue = Int.min
var minValue = Int.max

calculate(numbers[0], 1)
print(maxValue)
print(minValue)

func calculate(_ sum: Int, _ depth: Int) {
    if depth == n {
        maxValue = max(maxValue, sum)
        minValue = min(minValue, sum)
        return
    }
    
    for i in 0..<4 {
        if ops[i] > 0 {
            ops[i] -= 1
            switch i {
            case 0:
                calculate(sum + numbers[depth], depth + 1)
            case 1:
                calculate(sum - numbers[depth], depth + 1)
            case 2:
                calculate(sum * numbers[depth], depth + 1)
            default:
                calculate(sum / numbers[depth], depth + 1)
            }
            ops[i] += 1
        }
    }
}
