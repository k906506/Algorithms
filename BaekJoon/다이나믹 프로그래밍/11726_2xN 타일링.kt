import java.util.*

class `11726` {
    fun main() {
        val sc = Scanner(System.`in`)
        val n = sc.nextInt()
        val array = IntArray(n + 1) { 0 }

        if (n == 1) println(1)
        else if (n == 2) println(2)
        else {
            for (i in 3..n) {
                array[n] = (array[n - 1] + array[n - 2]) % 10007
            }
            println(array[n])
        }
    }
}
