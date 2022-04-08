import java.io.BufferedReader
import java.io.InputStreamReader
import java.lang.Integer.max
import java.util.*

var t = 0

fun main() = with(Scanner(System.`in`)) {
    t = nextInt()

    for (i in 0 until t) {
        var n = nextInt()
        var arrayList = Array(2) { Array(n) { nextInt() } }
        var dp = Array(2) { Array(n + 2) { 0 } }

        dp[0][1] = arrayList[0][1]
        dp[1][1] = arrayList[1][1]

        for (j in 2 until n + 2) {
            println(j)
            dp[0][j] = max(dp[1][j - 1], dp[1][j - 2]) + arrayList[0][j]
            dp[1][j] = max(dp[0][j - 1], dp[0][j - 2]) + arrayList[1][j]
        }

        println(max(dp[0][n], dp[1][n]))
    }
}
