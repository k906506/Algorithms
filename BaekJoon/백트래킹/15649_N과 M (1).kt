import java.util.*

lateinit var visit: Array<Int>
lateinit var input: Array<Int>
var n: Int = 0
var m: Int = 0

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    m = nextInt()

    visit = Array(n + 1) { 0 }
    input = Array(n + 1) { 0 }

    dfs(0)
}

fun dfs(depth: Int) {
    if (depth == m) {
        for (i in 0 until m) {
            print("${input[i]} ")
        }
        println()
        return
    }

    for (i in 0 until n) {
        if (visit[i] == 0) {
            visit[i] = 1

            input[depth] = i + 1
            dfs(depth + 1)

            visit[i] = 0
        }
    }
    return
}
