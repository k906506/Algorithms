import Foundation

func solution(_ n:Int) -> Int {
    if n < 7 {
        return 1
    } else {
        var a: Int = n / 7
        var b: Int = n - a * 7
        return b == 0 ? a : a + 1
    }
}
