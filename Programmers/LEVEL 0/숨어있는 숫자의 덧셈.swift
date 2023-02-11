import Foundation

func solution(_ my_string:String) -> Int {
    var temp: String = ""
    var result: Int = 0
    
    for e in my_string {
        if UnicodeScalar(String(e))!.value <= 57 {
            temp += String(e)
        } else {
            if temp.count > 0 {
                result += Int(temp)!
                temp = ""
            }
        }
    }
    
    if temp.count > 0 {
        result += Int(temp)!
        temp = ""
    }
    
    return result
}