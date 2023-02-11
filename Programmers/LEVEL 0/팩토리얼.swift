import Foundation

func solution(_ n:Int) -> Int {
    var result: Int = 1
    
    while true {
        if factorial(n: result) > n {
            result -= 1
            break
        } else {
            result += 1
        }
    }
    
    return result
}

func factorial(n: Int) -> Int {
    if n <= 1 {
        return 1
    } else {
        return n * factorial(n: n - 1)
    }
}