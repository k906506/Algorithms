import java.util.*
import kotlin.math.abs

lateinit var array: Array<Int>
var n = 0
var cnt = 0

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    array = Array(n) { 0 }

    nQueen(0)
    println(cnt)
}

fun nQueen(depth: Int) { // depth는 row
    if (depth == n) {
        cnt++
        return
    }

    for (i in 0 until n) { // i는 col
        array[depth] = i

        if (check(depth)) {
            nQueen(depth + 1)
        }
    }
}

fun check(row: Int): Boolean {
    for (i in 0 until row) {
        // 1. 이전 열 (저장되어 있는 값) 과 비교, index 값이 row 이므로 행은 무조건 다름
        if (array[row] == array[i]) return false
        // 2. 대각선 비교
        else if (abs(array[row] - array[i]) == abs(row - i)) return false
    }
    return true
}
