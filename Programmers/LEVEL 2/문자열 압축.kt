fun solution(s: String): Int {
    var minLength = s.length

    for (i in 0 until s.length / 2) {
        var subString = s.slice(0..i)
        var answer = ""
        var cnt = 1
        var last = 0

        for (j in i + 1 until s.length - i step i + 1) {
            // 마지막 Index 를 저장한다.
            last = j + i + 1
            // 같은 SubString 인 경우 이를 카운트한다.
            if (subString == s.slice(j..j + i)) cnt += 1
            // 다른 SubString 인 경우
            else {
                if (cnt > 1) {
                    // 숫자 + SubString 으로 변환한다.
                    answer += cnt.toString() + subString
                } else {
                    answer += subString
                }
                // SubString 을 새롭게 설정한다.
                subString = s.slice(j..j + i)
                cnt = 1
            }
        }

        // 한 번 더 진행한다.
        if (cnt > 1) {
            answer += cnt.toString() + subString
        } else {
            answer += subString
        }

        // 남아 있는 문자열을 추가한다.
        answer += s.slice(last until s.length)

        // 문자열의 크기를 비교한다.
        if (minLength > answer.length) minLength = answer.length
    }
    return minLength
}
