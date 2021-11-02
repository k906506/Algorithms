class Solution {
    fun solution(N: Int, stages: IntArray): IntArray {
        var answer = intArrayOf()
        var onStage = mutableMapOf<Int, Int>()
        var ratio = mutableMapOf<Int, Double>()

        for (i in 1..N) {
            onStage[i] = 0
        }

        for (e in stages.iterator()) {
            if (e <= N) {
                onStage[e] = onStage.getValue(e) + 1
            }
        }

        for (i in 1..N) {
            ratio[i] = 0.0
        }

        var total = stages.size
        for (i in 1..N) {
            if (onStage[i] != 0) {
                ratio[i] = onStage.getValue(i) / total.toDouble()
                total -= onStage.getValue(i)
            }
        }

        var mapToList = ratio.toList()
        mapToList = mapToList.sortedByDescending { it.second }

        for (e in mapToList.iterator()) {
            answer = answer.plus(e.first)
        }

        return answer
    }
}
