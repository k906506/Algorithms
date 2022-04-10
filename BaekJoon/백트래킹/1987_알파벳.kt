import java.lang.Integer.max
import java.util.*

var n = 0
var m = 0
var max_value = 0
val dx = listOf(-1, 1, 0, 0)
val dy = listOf(0, 0, -1, 1)
lateinit var board: Array<Array<String>>
lateinit var check: Array<Int>

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    m = nextInt()

    board = Array(n) { Array(m) { "" } }
    check = Array(26) { 0 }

    for (i in 0 until n) {
        val s = next().chunked(1)
        for (j in 0 until m) {
            board[i][j] = s[j]
        }
    }

    val index = board[0][0].toCharArray()[0].toInt() - 65
    check[index] = 1

    move(0, 0, 1)

    println(max_value)
}

fun move(x: Int, y: Int, cnt: Int) {
    max_value = max(max_value, cnt)

    for (i in 0 until 4) {
        val nx = x + dx[i]
        val ny = y + dy[i]

        if (nx in 0 until n && ny in 0 until m) {
            val index = board[nx][ny].toCharArray()[0].toInt() - 65
            if (check[index] == 0) {
                check[index] = 1
                move(nx, ny, cnt + 1)
                check[index] = 0
            }
        }
    }
}
