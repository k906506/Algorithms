import java.lang.Integer.min
import java.util.*
import kotlin.math.abs
import kotlin.system.exitProcess

lateinit var board: Array<Array<Int>>
lateinit var visited: Array<Int>
var min_value = Int.MAX_VALUE
var n = 0

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    board = Array(n) { Array(n) { nextInt() } }
    visited = Array(n) { 0 }

    search(0, 0)
    println(min_value)
}

fun search(index: Int, depth: Int) {
    if (depth == n / 2) {
        calculate()
        return
    }

    for (i in index until n) {
        if (visited[i] == 0) {
            visited[i] = 1
            search(i + 1, depth + 1)
            visited[i] = 0
        }
    }
}

fun calculate() {
    var start = 0
    var link = 0

    for (i in 0 until n - 1) {
        for (j in i until n) {
            if (visited[i] == 1 && visited[j] == 1) {
                start += board[i][j]
                start += board[j][i]
            } else if (visited[i] == 0 && visited[j] == 0) {
                link += board[i][j]
                link += board[j][i]
            }
        }
    }

    val score = abs(start - link)

    if (score == 0) {
        println(score)
        exitProcess(0)
    }

    min_value = min(score, min_value)
}
