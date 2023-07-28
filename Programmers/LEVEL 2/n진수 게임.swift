func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String { // n진수, 구해야할 숫자의 개수, 사람 수, 튜브의 순서 
    var ans = ""
    var tubeIdx = p

    let arrayOfS = decimalToSpecial(n) // 10진수 -> n진수 

    for _ in 0..<t {
        ans += arrayOfS[tubeIdx - 1]
        tubeIdx += m
    }

    return ans
}

// 10진수를 n진수로 변환하는 메서드
func decimalToSpecial(_ n: Int) -> [String] {
    // 1.
    var numbers = [Int](repeating: 0, count: 100000)

    for i in 0..<100000 {
        numbers[i] = i
    }

    // 2.
    var s = ""

    for number in numbers {
        s += String(number, radix: n) // n진수로 변환
    }

    // 소문자 -> 대문자
    s = s.uppercased()

    // 탐색의 편의를 위해 String -> [String]
    let arrayOfS = s.map { String($0) }
    return arrayOfS
}
