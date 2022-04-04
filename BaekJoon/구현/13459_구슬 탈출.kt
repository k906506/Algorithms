import java.util.*

data class Point(
    val x: Int,
    val y: Int
)

data class Points(
    val red_x: Int,
    val red_y: Int,
    val blue_x: Int,
    val blue_y: Int,
    val depth: Int
)

data class Infos(
    val x: Int,
    val y: Int,
    val cnt: Int
)

lateinit var array: Array<Array<String>>
val dx = arrayOf(1, -1, 0, 0)
val dy = arrayOf(0, 0, 1, -1)
var n = 0
var m = 0
var red = Point(0, 0)
var blue = Point(0, 0)

fun main() = with(Scanner(System.`in`)) {
    n = nextInt()
    m = nextInt()

    array = Array(n) { Array(m) { "" } }

    for (i in 0 until n) {
        val input = next().chunked(1)
        for (j in 0 until m) {
            array[i][j] = input[j]
        }
    }

    // 우선 R, B의 좌표를 찾음
    find()

    // 탐색
    bfs()
}

fun find() {
    for (i in 0 until n) {
        for (j in 0 until m) {
            if (array[i][j] == "#" || array[i][j] == ".") continue
            else if (array[i][j] == "R") red = Point(i, j)
            else if (array[i][j] == "B") blue = Point(i, j)
        }
    }
}

fun bfs() {
    var visited = Array(n) { Array(m) { Array(n) { Array(m) { 0 } } } }
    var map = LinkedList<Points>()

    map.add(Points(red.x, red.y, blue.x, blue.y, 1))
    visited[red.x][red.y][blue.x][blue.y] = 1

    while (map.isNotEmpty()) {
        val current = map.poll()

        if (current.depth > 10) break

        for (i in 0..3) {
            var redInfos = move(current.red_x, current.red_y, dx[i], dy[i])
            var blueInfos = move(current.blue_x, current.blue_y, dx[i], dy[i])

            if (array[blueInfos.x][blueInfos.y] == "O") continue
            if (array[redInfos.x][redInfos.y] == "O") {
                println(1)
                return
            }

            if (redInfos.x == blueInfos.x && redInfos.y == blueInfos.y) {
                if (redInfos.cnt > blueInfos.cnt) {
                    redInfos = Infos(redInfos.x - dx[i], redInfos.y - dy[i], redInfos.cnt)
                } else {
                    blueInfos = Infos(blueInfos.x - dx[i], blueInfos.y - dy[i], blueInfos.cnt)
                }
            }

            val points = Points(redInfos.x, redInfos.y, blueInfos.x, blueInfos.y, current.depth + 1)

            if (visited[points.red_x][points.red_y][points.blue_x][points.blue_y] == 1) continue
            visited[points.red_x][points.red_y][points.blue_x][points.blue_y] = 1

            map.add(points)
        }

    }
    println(0)
}

fun move(x: Int, y: Int, dx: Int, dy: Int): Infos {
    var nx = x
    var ny = y
    var cnt = 0

    while (array[nx + dx][ny + dy] != "#" && array[nx][ny] != "O") {
        nx += dx
        ny += dy
        cnt += 1
    }

    return Infos(nx, ny, cnt)
}
