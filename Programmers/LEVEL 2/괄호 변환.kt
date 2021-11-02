class Solution {
    // 올바른 괄호인지 판별하는 메소드
    fun correctString(string : String) : Boolean {
        var cnt = 0
        for (e in string) {
            if (e == '(') {
                cnt += 1
            } else {
                cnt -= 1
            }
            if (cnt < 0) { // 0보다 작은 경우 무조건 옳바르지 못한 괄호
                return false
            }
        }
        if (cnt != 0) return false  // 모든 괄호를 탐색했음에도 0이 아닌 경우 무조건 올바르지 못한 괄호
        return true
    }
    
    fun madeCorrectString(string : String, answer : String) : String {
        if (string.length == 0) { // 들어온 괄호가 빈 문자열인 경우 빈 문자열 리턴
            return ""
        }
        var cnt = 0
        var index = 0
        var frontString = ""
        var backString = ""
        var another = answer
        
        for (e in string) {
            if (e == '(') {
                frontString += e
                cnt += 1
                index += 1
            }
            else {
                frontString += e
                cnt -= 1
                index += 1
            }
            if (cnt == 0) { // 균형 잡힌 괄호이므로 for문 종료
                break
            }
        }
        
        backString = string.removeRange(0, index) // 균형 잡힌 괄호를 제거한 나머지
        
        if (correctString(frontString)) { // 분리한 괄호가 올바른 괄호인 경우
            println("${string} ${frontString}")
            madeCorrectString(backString, another) // 나머지 괄호에 대해 재귀적으로 진행
        } else { // 올바른 괄호가 아닌 경우
            var tempString = ""
            tempString += '('
            tempString += madeCorrectString(backString, another) // 나머지 괄호에 대해 재귀적으로 진행
            tempString += ')'
            tempString += tempString.slice(1..frontString.length - 2).reversed() // frontString 앞뒤 문자를 제거하고 순서 변경
            another += backString
        }
        return another
    }
    
    fun solution(p: String): String {
        var answer = ""
        if (correctString(p)) { // 올바른 괄호인 경우
            answer = p
        } else { // 균형 잡힌 괄호로 분리하여
            answer = madeCorrectString(p, answer)
        }
        return answer
    }
}
