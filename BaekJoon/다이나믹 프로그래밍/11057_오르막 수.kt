import java.util.*

var n = 0
lateinit var dp: Array<Array<Int>>

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()

    // 0으로 끝날 때와 한 자리 일 때는 무조건 오르막 수는 1개
    dp = Array(n + 1) { Array(10) { 1 } }

    for (i in 1..n) {
        for (j in 1..9) {
            dp[i][j] = (dp[i - 1][j] + dp[i][j - 1]) % 10007
        }
    }

    println((dp[n - 1].sum()) % 10007)
}
