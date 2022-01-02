import java.util.*

class `9095` {
    private var array = IntArray(12) { 0 }

    fun main() {
        val sc = Scanner(System.`in`)
        val n = sc.nextInt()

        for (i in 0 until n) {
            val num = sc.nextInt()

            when (num) {
                1 -> println(1)
                2 -> println(2)
                3 -> println(4)
                else -> count(num)
            }
        }
    }

    fun count(number: Int) {
        array[1] = 1
        array[2] = 2
        array[3] = 4

        for (i in 4..number) {
            array[i] = array[i - 1] + array[i - 2] + array[i - 3]
        }

        println(array[number])
        return
    }
}
