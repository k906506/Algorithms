import Foundation

func solution(_ my_string:String) -> String {
    var checks: [Int] = [Int](repeating: 0, count: 255)
    var temp: [String] = my_string.map { String($0) }
    var result: String = ""
    
    for e in temp {
        var index: Int = Int(UnicodeScalar(e)!.value)
        if checks[index] == 0 {
            checks[index] += 1
            result += e
        }
    }
    
    return result
}