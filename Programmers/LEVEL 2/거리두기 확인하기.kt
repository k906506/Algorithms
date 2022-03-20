import java.util.*

class Solution {
    fun solution(places: Array<Array<String>>): IntArray {
        val answer = mutableListOf<Int>()
        val size = places.size

        for (place in places) {
            var check = 0

            for (i in 0 until size) {
                for (j in 0 until size) {
                    if (place[i][j] == 'P') {
                        if (bfs(place, i, j, size).not()) {
                            check = 1
                            break
                        }
                    }
                }

                if (check == 1) {
                    break
                }
            }

            if (check == 1) answer.add(0)
            else answer.add(1)
        }

        return answer.toIntArray()
    }

    fun bfs(place: Array<String>, src_x: Int, src_y: Int, size: Int): Boolean {
        val queue = LinkedList<Array<Int>>()
        var visited = Array(size) { IntArray(size) { 0 } }

        val dx = arrayOf(0, 0, 1, -1)
        val dy = arrayOf(1, -1, 0, 0)

        queue.add(arrayOf(src_x, src_y, 0)) // x, y, 거리
        visited[src_x][src_y] = 1

        while (queue.isNotEmpty()) {
            val element = queue.poll()
            val x = element[0]
            val y = element[1]
            val dist = element[2]

            if (dist >= 3) return true
            else if (dist != 0 && place[x][y] == 'P') return false

            for (i in 0..3) {
                val nx = x + dx[i]
                val ny = y + dy[i]
                val nd = dist + 1
                if (nx in 0 until size && ny in 0 until size) {
                    if (place[nx][ny] != 'X' && visited[nx][ny] == 0) {
                        queue.add(arrayOf(nx, ny, nd))
                        visited[nx][ny] = 1 // 해당지점 방문
                    }
                }
            }
        }

        return true
    }
}
