import java.util.*

fun main() {
    val sc = Scanner(System.`in`)
    val x = sc.nextInt()
    val y = sc.nextInt()
    var total = 0

    for (i in 1..x - 1) {
        when (i) {
            1, 3, 5, 7, 8, 10, 12 -> total += 31
            4, 6, 9, 11 -> total += 30
            else -> total += 28
        }
    }

    total += y
    total %= 7

    when (total) {
        0 -> print("SUN")
        1 -> print("MON")
        2 -> print("TUE")
        3 -> print("WED")
        4 -> print("THU")
        5 -> print("FRI")
        6 -> print("SAT")
    }
}

