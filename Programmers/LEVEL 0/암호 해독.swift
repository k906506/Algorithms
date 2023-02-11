import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    var arrayCipher = cipher.map { String($0) }
    var result: String = ""

    for i in 0..<cipher.count {
        if (i + 1) % code == 0 {
            result += arrayCipher[i]
        }
    }

    return result
}