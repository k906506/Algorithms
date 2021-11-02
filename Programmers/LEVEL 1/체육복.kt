class Solution {
    fun solution(n: Int, lost: IntArray, reserve: IntArray): Int {
        var answer = 0
        var clothes = Array<Int>(n + 2, { 1 }) // 시작과 끝을 추가해서 Error 방지

        for (i in lost.iterator()) { // 잃어버린 학생은  - 1
            clothes[i] -= 1
        }

        for (i in reserve.iterator()) { // 여벌이 있는 학생은 + 1
            clothes[i] += 1
        }

        for (i in 1..n) { // 1, 2, ... n
            if (clothes[i] == 0) { // 체육복이 없는 경우
                if (clothes[i-1] == 2) {
                    clothes[i-1] -= 1
                    clothes[i] += 1
                } else if (clothes[i+1] == 2) {
                    clothes[i+1] -= 1
                    clothes[i] += 1
                }
            }
        }
        
        for (i in 1..n) {
            if (clothes[i] >= 1) {
                answer += 1
            }
        }
        
        return answer
    }
}

