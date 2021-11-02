class Solution {
    fun solution(numbers: IntArray): Int {
        var answer: Int = 45
        for (e in numbers) {
            answer -= e   
        }
        return answer
    }
}
