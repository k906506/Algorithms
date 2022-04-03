import java.util.*

var l = 0
var c = 0
lateinit var array: Array<String>
lateinit var sortedArray: Array<String>
lateinit var input: Array<String>
lateinit var visited: Array<Int>
var stringBuilder = StringBuilder()

fun main() = with(Scanner(System.`in`)) {
    l = nextInt()
    c = nextInt()

    array = Array(c) { next() }
    sortedArray = array.sortedArray()

    input = Array(c) { "" }
    visited = Array(c) { 0 }

    dfs(0, 0)
    println(stringBuilder)
}

fun dfs(index: Int, depth: Int) {
    if (depth == l) {
        var consonants = 0 // 최소 2개의 자음
        var vowels = 0 // 최소 1개의 모음

        for (i in 0 until c) {
            if (visited[i] == 1) {
                if (check(sortedArray[i])) vowels++
                else consonants++
            }
        }

        if (consonants >= 2 && vowels >= 1) {
            for (i in 0 until c) {
                if (visited[i] == 1) stringBuilder.append(sortedArray[i])
            }
            stringBuilder.append("\n")
        }
        return
    }

    for (i in index until c) {
        if (visited[i] == 0) {
            visited[i] = 1
            dfs(i, depth + 1)
            visited[i] = 0
        }
    }
    return
}

fun check(e: String): Boolean {
    return e == "a" || e == "e" || e == "i" || e == "o" || e == "u"
}
