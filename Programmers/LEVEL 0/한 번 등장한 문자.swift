import Foundation

func solution(_ s:String) -> String {
    var checks: [Int] = [Int](repeating: 0, count: 255)
    
    for e in s {
        var index: Int = Int(UnicodeScalar(String(e))!.value)
        checks[index] += 1
    }
    
    var result: [String] = []
    for i in 0..<checks.count {
        if checks[i] == 1 {
            result.append(String(UnicodeScalar(i)!))
        }
    }
    
    return result.sorted().joined()
}