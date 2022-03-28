import java.util.*

lateinit var visit: Array<Int>
lateinit var input: Array<Int>
var n: Int = 0
var m: Int = 0
var stringBuilder = StringBuilder()

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    m = nextInt()

    visit = Array(n + 1) { 0 }
    input = Array(n + 1) { 0 }

    dfs(0, 0)
    println(stringBuilder)
}

fun dfs(depth: Int, before : Int) {
    if (depth == m) {
        for (i in 0 until m) {
            stringBuilder.append(input[i]).append(" ")
        }
        stringBuilder.append("\n")
        return
    }

    for (i in 0 until n) {
        if (before > i + 1) continue
        input[depth] = i + 1
        dfs(depth + 1, i + 1)
    }
    return
}
