import java.util.*

lateinit var array: Array<Array<Int>>
var n = 0
var k = 0

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    k = nextInt()

    // 파스칼의 삼각형을 사용하기 위한 배열 초기화
    array = Array(n + 1) { Array(n + 1) { 1 } }

    // nCr = n-1Ck-1 + n-1Ck
    for (i in 1..n) {
        for (j in 0..n) {
            if (i == j || j == 0) {
                array[i][j] = 1
            } else {
                array[i][j] = (array[i - 1][j - 1] + array[i - 1][j]) % 10007
            }
        }
    }

    println(array[n][k])
}
