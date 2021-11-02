class Solution {
    fun solution(array: IntArray, commands: Array<IntArray>): IntArray {
        var answer = intArrayOf()
        for (i in commands.indices) {
            var copyArray = array.toList()
            var srt = commands[i][0] - 1
            var dst = commands[i][1] - 1
            var select = commands[i][2] - 1
            copyArray = copyArray.slice(srt..dst).toMutableList()
            copyArray.sort()
            answer = answer.plus(copyArray[select])
        }
        return answer
    }
}
