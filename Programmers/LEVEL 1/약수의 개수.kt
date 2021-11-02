class Solution {
    fun checkPrime(num: Int): Boolean {
        for (i in 2..num - 1) {
            if (num % i == 0) return false
        }
        return true
    }

    fun findEvenFactor(num: Int): Boolean {
        var cnt = 0
        for (i in 1..num) {
            if (num % i == 0) {
                cnt += 1
            }
        }
        if (cnt % 2 == 0) return true
        else return false
    }

    fun solution(left: Int, right: Int): Int {
        var answer: Int = 0

        for (i in left..right) {
            if (i == 1) {
                answer -= 1
            } else if (checkPrime(i)) {
                answer += i
            } else {
                if (findEvenFactor(i)) {
                    answer += i
                } else {
                    answer -= i
                }
            }
        }
        return answer
    }
}
