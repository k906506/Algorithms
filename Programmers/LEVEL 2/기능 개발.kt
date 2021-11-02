class Solution {
    fun solution(progresses: IntArray, speeds: IntArray): IntArray {
        var answer = intArrayOf()
        var array = arrayListOf<Int>()
        var days = arrayListOf<Int>()

        array = progresses.toCollection(ArrayList())

        // 100을 달성하는 일자를 계산하는 과정
        for (i in 0 until array.size) {
            var day = 0
            while (array[i] < 100) {
                array[i] += speeds[i]
                day += 1
            }
            days.add(day)
        }

        // 한번에 배포하는 기능을 찾는 과정
        while (days.isNotEmpty()) {
            var standard = days.removeAt(0)
            var cnt = 1

            while (days.isNotEmpty() && days.first() <= standard) {
                days.removeAt(0)
                cnt += 1
            }
            answer = answer.plus(cnt)
        }

        return answer
    }
}
