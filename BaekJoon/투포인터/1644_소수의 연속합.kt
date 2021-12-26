import java.util.*

fun main() {
    val sc = Scanner(System.`in`)
    val n = sc.nextInt()
    val array = isPrime(n)
    var left = 0
    var right = 0
    var sum = 0
    var cnt = 0

    while (true) {
        if (sum >= n) {
            if (sum == n) cnt++
            sum -= array[left++]
        } else if (right == array.size) {
            break
        } else {
            sum += array[right++]
        }
    }

    println(cnt)
}

fun isPrime(num: Int): IntArray {
    var check = BooleanArray(num + 1) { true }
    var array = mutableListOf<Int>()

    for (i in 2..num) {
        if (check[i]) {
            for (j in 2 * i..num step i) check[j] = false
        }
    }

    for (i in 2..num) {
        if (check[i]) array.add(i)
    }

    return array.toIntArray()
}
