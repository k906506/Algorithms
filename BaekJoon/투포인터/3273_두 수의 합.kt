import java.util.*

fun main(args: Array<String>) {
    val sc = Scanner(System.`in`)
    val n = sc.nextInt()
    val array = IntArray(n) { sc.nextInt() }
    val x = sc.nextInt()
    var cnt = 0
    var left = 0
    var right = n - 1

    array.sort()

    while (left != right) {
        if (array[left] + array[right] == x) {
            cnt++
            left++
        } else if (array[left] + array[right] > x) {
            right--
        } else {
            left++
        }
    }
    println(cnt)
}
