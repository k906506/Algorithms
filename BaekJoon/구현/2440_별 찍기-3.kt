import java.util.*

fun main() {
    val sc = Scanner(System.`in`)
    val n = sc.nextInt()

    for (i in 0..n - 1) {
        for (j in 0..n - 1 - i) {
            print("*")
        }
        for (k in 0..i - 1) {
            print("")
        }
        println()
    }
}
