import java.lang.Integer.max
import java.util.*

class `11052` {
    fun main() {
        val sc = Scanner(System.`in`)
        val n = sc.nextInt()
        var array = IntArray(n + 1) { 0 }
        var dp = IntArray(n + 1) { 0 }

        for (i in 1..n) {
            array[i] = sc.nextInt()
        }

        dp[0] = 0

        for (i in 1..n) {
            for (j in 0..i) {
                dp[i] = max(dp[i], dp[i - j] + array[j])
            }
        }

        print(dp[n])
    }
}
