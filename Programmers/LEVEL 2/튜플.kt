class Solution {
    fun solution(s: String): IntArray {
        val string = s.slice(2 until s.length - 2)
        val array = string.split("},{")
        val sortedArray = array.sortedBy { it.length }
        val answer = mutableListOf<Int>()

        for (e in sortedArray) {
            val splitString = e.split(',')
            for (num in splitString) {
                if (answer.contains(num.toInt()).not()) answer.add(num.toInt())
            }
        }

        return answer.toIntArray()
    }
}
