import java.lang.Integer.max
import java.lang.Integer.min
import java.util.*

var n = 0
var max_value = Int.MIN_VALUE
var min_value = Int.MAX_VALUE
lateinit var array: Array<Int>
lateinit var operator: Array<Int>

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    array = Array(n) { nextInt() }
    operator = Array(4) { nextInt() }

    calculate(array[0], 1)
    println(max_value)
    println(min_value)
}

fun calculate(sum: Int, index: Int) {
    if (index == n) {
        max_value = max(sum, max_value)
        min_value = min(sum, min_value)
        return
    }

    for (i in 0..3) {
        if (operator[i] > 0) {
            operator[i]--
            when (i) {
                0 -> calculate(sum + array[index], index + 1)
                1 -> calculate(sum - array[index], index + 1)
                2 -> calculate(sum * array[index], index + 1)
                3 -> calculate(sum / array[index], index + 1)
            }
            operator[i]++
        }
    }
}
