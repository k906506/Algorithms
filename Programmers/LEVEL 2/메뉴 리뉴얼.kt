class Solution {
    // 문자열의 조합을 만들어주는 메소드
    fun madeCombination(total: String, part: String, made: MutableList<String>, start: Int, cnt: Int, n: Int) {
        if (cnt == n) {
            made.add(part)
            return
        }

        for (i in start until total.length) {
            madeCombination(total, part + total[i], made, i + 1, cnt + 1, n)
        }
    }

    fun solution(orders: Array<String>, course: IntArray): Array<String> {
        var answer: Array<String> = arrayOf<String>()
        var madeCourses = mutableMapOf<String, Int>()
        var made = mutableListOf<String>()

        for (order in orders) {
            var part = ""
            var temp = order.toCharArray()
            var sortedOrder = temp.sorted().joinToString("")

            for (i in course) {
                var start = 0
                var cnt = 0
                madeCombination(sortedOrder, part, made, start, cnt, i)
            }
        }

        for (element in made) {
            if (madeCourses[element] == null) {
                madeCourses[element] = 1
            } else {
                madeCourses[element] = madeCourses.getValue(element) + 1
            }
        }

        var mapToList = madeCourses.toList()
        mapToList = mapToList.sortedWith(compareBy({ it.first.length }, { -it.second }))


        for (i in course) {
            var beforeOrderMaxCount = 0
            for (j in mapToList.indices) {
                if ((mapToList[j].first.length == i) && (mapToList[j].second >= 2)) {
                    if (beforeOrderMaxCount < mapToList[j].second) {
                        beforeOrderMaxCount = mapToList[j].second
                        answer = answer.plus(mapToList[j].first)
                    } else if (beforeOrderMaxCount == mapToList[j].second) {
                        answer = answer.plus(mapToList[j].first)
                    }
                }
            }
        }

        answer.sort()

        return answer
    }
}
