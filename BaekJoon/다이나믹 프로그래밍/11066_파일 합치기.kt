import java.io.BufferedReader
import java.io.InputStreamReader
import java.lang.Integer.min

lateinit var dp: Array<Array<Int>>
lateinit var sum: Array<Int>

fun main() = with(BufferedReader(InputStreamReader(System.`in`))) {
    val t = readLine().toInt()

    repeat(t) {
        val k = readLine().toInt()
        val temp = readLine().split(" ").map { it.toInt() }

        dp = Array(k + 1) { Array(k + 1) { 0 } }
        sum = Array(k + 1) { 0 }

        for (i in 1..k) {
            sum[i] = temp[i - 1] + sum[i - 1]
        }

        calculate(k)
    }
}

fun calculate(k: Int) {
    for (i in 1 until k) {
        for (j in 1..k - i) {
            val k = j + i
            dp[j][k] = Int.MAX_VALUE

            for (l in j until k) {
                dp[j][k] = min(dp[j][k], dp[j][l] + dp[l + 1][k] + sum[k] - sum[j - 1])
            }
        }
    }
    println(dp[1][k])
}
