import java.util.*

lateinit var array: Array<Int>
var n = 0
var k = 0

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    k = nextInt()

    // 재귀 대신 DP로 팩토리얼 구현
    array = Array(n + 1) { 1 }

    // 팩토리얼 계산
    for (i in 2..n) {
        array[i] = array[i - 1] * i
    }

    // 조합 공식 적용
    println(array[n] / (array[n - k] * array[k]))
}
