import java.io.BufferedReader
import java.io.InputStreamReader
import java.lang.Integer.max

fun main() = with(BufferedReader(InputStreamReader(System.`in`))) {
    val first = readLine().chunked(1)
    val second = readLine().chunked(1)

    val row = first.size
    val col = second.size

    val dp = Array(row + 1) { Array(col + 1) { 0 } }

    for (i in 1..row) {
        for (j in 1..col) {
            if (first[i - 1] == second[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }

    println(dp[row][col])
}
