class Solution {
    fun solution(answers: IntArray): IntArray {
        val student = arrayOf(arrayOf(1, 2, 3, 4, 5), arrayOf(2, 1, 2, 3, 2, 4, 2, 5), arrayOf(3, 3, 1, 1, 2, 2, 4, 4, 5, 5))
        var answerStudent = arrayOf(0, 0, 0)
        var temp = arrayListOf<Int>()
        var answer = intArrayOf()
        
        for (i in 0..2) {
            var index = 0
            var cnt = 0
            for (j in answers.indices) {
                if (answers[j] == student[i][index]) {
                    cnt += 1
                }
                if (index == student[i].size - 1) {
                    index = 0
                } else {
                    index += 1
                }
            }
            answerStudent[i] = cnt
        }
        
        val maxValue = answerStudent.max()
        
        for (i in 0..2) {
            if (maxValue == answerStudent[i]) {
                temp.add(i+1)
            }
        }
        
        temp.sort()
        
        answer = temp.toIntArray()
        return temp
    }
 
}
