class Solution {
    fun solution(absolutes: IntArray, signs: BooleanArray): Int {
        var answer : Int = 0
        for (i in 0 until absolutes.size) {
            if (signs[i] == true) {
                answer += absolutes[i]
            }
            else {
                answer -= absolutes[i]
            }
        }
        return answer
    }
}
