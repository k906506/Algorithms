import java.util.*

fun main() {
    val sc = Scanner(System.`in`)
    val n = sc.nextInt()
    val s = sc.nextInt()
    val array = IntArray(n) { sc.nextInt() }
    var partSum = 0
    var partLength = 100000
    var left = 0
    var right = 0

    while (true) {
        if (partSum >= s) {
            partLength = Math.min(partLength, right - left)
            partSum -= array[left++]
        } else if (right == n) {
            break
        } else {
            partSum += array[right++]
        }
    }

    if (partLength == 100000) print(0)
    else print(partLength)
}
