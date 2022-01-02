import java.util.*

class `2193` {
    fun main() {
        val sc = Scanner(System.`in`)
        val n = sc.nextInt()
        var array = LongArray(n + 1) { 0 }

        when (n) {
            1 -> println(1)
            2 -> println(1)
            else -> {
                array[1] = 1
                array[2] = 1

                for (i in 3..n) {
                    array[i] = array[i - 1] + array[i - 2]
                }

                println(array[n])
            }
        }
    }
}
