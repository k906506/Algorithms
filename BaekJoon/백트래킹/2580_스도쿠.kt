import java.util.*
import kotlin.system.exitProcess

lateinit var board: Array<Array<Int>>

fun main() = with(Scanner(System.`in`)) {
    board = Array(9) { Array(9) { 0 } }

    // 주어진 배열을 입력
    for (i in 0 until 9) {
        for (j in 0 until 9) {
            board[i][j] = nextInt()
        }
    }

    // (0, 0) 부터 시작
    sudoku(0, 0)
}


fun check(row: Int, col: Int, value: Int): Boolean {
    // 1. 같은 행, 다른 열에 같은 값이 존재하는지 확인
    for (i in 0 until 9) {
        if (board[row][i] == value) return false
    }

    // 2. 다른 행, 같은 열에 같은 값이 존재하는지 확인
    for (i in 0 until 9) {
        if (board[i][col] == value) return false
    }

    // 3. (3x3) 블럭 내부에 같은 값이 존재하는지 확인
    // 현재 위치가 어느 위치의 (3x3) 블럭에 있는지를 우선 확인
    val r_index  = row / 3 * 3
    val c_index = col / 3 * 3

    for (i in 0 until 3) {
        for (j in 0 until 3) {
            if (board[r_index + i][c_index + j] == value) return false
        }
    }

    return true
}

fun sudoku(row: Int, col: Int) {
    if (col == 9) {
        sudoku(row + 1, 0)
        return
    }

    if (row == 9) {
        val stringBuilder = StringBuilder()

        board.map {
            it.iterator().forEach { e ->
                stringBuilder.append(e).append(' ')
            }
            stringBuilder.append('\n')
        }

        println(stringBuilder)
        // 시스템 종료
        exitProcess(0)
    }

    if (board[row][col] == 0) {
        for (i in 1..9) {
            if (check(row, col, i)) {
                board[row][col] = i
                sudoku(row, col + 1)
            }
        }
        board[row][col] = 0
        return;
    }

    sudoku(row, col + 1)
}
