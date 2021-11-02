class Solution {
    fun solution(new_id: String): String {
        var answer = new_id

        val reg1 = Regex("[a-z0-9-_.]")
        val reg2 = Regex("[.]{2,}")

        answer = answer.toLowerCase()
        var temp = StringBuilder()

        for (e in answer) {
            if (reg1.containsMatchIn(e.toString())) {
                temp.append(e)
            }
        }

        answer = temp.toString().replace(reg2, ".")

        if (answer.isNotEmpty() && answer.first() == '.') answer = answer.removeRange(0, 1)
        if (answer.isNotEmpty() && answer.last() == '.') answer = answer.removeRange(answer.length-1, answer.length)

        if (answer.isEmpty()) answer = "a"
        
        if (answer.length >= 16) {
            answer = answer.slice(0..14)
        }
        
        if (answer.isNotEmpty() && answer.first() == '.') answer = answer.removeRange(0, 1)
        if (answer.isNotEmpty() && answer.last() == '.') answer = answer.removeRange(answer.length-1, answer.length)
        
        while (answer.length <= 2) {
            answer = answer.plus(answer[answer.length - 1])
        }
        
        return answer
    }
}
