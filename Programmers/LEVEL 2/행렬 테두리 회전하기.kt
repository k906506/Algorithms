class Solution {
    fun min(a : Int, b : Int) : Int {
        if (a >= b) {
            return b
        } else {
            return a
        }
    }
    
    fun solution(rows: Int, columns: Int, queries: Array<IntArray>): IntArray {
        var answer = intArrayOf()
        var array = Array (rows) {Array (columns) {0}}
        var cnt = 1
        
        for (row in 0 until rows) {
            for (col in 0 until columns) {
                array[row][col] = cnt
                cnt += 1
            }
        }
        
        for (i in queries.indices) {
            var srt = Pair<Int, Int> (queries[i][0] - 1, queries[i][1] - 1) // index를 0부터 시작하기 위해 -1
            var dst = Pair<Int, Int> (queries[i][2] - 1, queries[i][3] - 1)
            var element = arrayListOf<Int>()
            var minValue = 10000
        
            // 1. 위쪽 줄은 오른쪽으로 한 칸씩 이동   
            for (j in srt.second..dst.second - 1) {
                element.add(array[srt.first][j])
                minValue = min(minValue, array[srt.first][j])
            }
            
            // 2. 오른쪽 줄은 아래로 한 칸씩 이동
            for (j in srt.first..dst.first - 1) {
                element.add(array[j][dst.second])
                minValue = min(minValue, array[j][dst.second])
            }
            
            // 3. 아래쪽 줄은 왼쪽으로 한 칸씩 이동
            for (j in dst.second downTo srt.second + 1) {
                element.add(array[dst.first][j])
                minValue = min(minValue, array[dst.first][j])
            }
            
            // 4. 왼쪽 줄은 위로 한 칸씩 이동
            for (j in dst.first downTo srt.first + 1) {
                element.add(array[j][srt.second])
                minValue = min(minValue, array[j][srt.second])
            }
            
            // 5. 회전시킨 값 중 최소값 Plus
            answer = answer.plus(minValue)
            
            // 6. 시계 방향으로 원소 회전
            val temp = element.removeAt(element.size - 1)
            element.add(0, temp) 
            
            // 7. 다시 삽입
            var index = 0
            for (j in srt.second..dst.second - 1) {
                array[srt.first][j] = element[index]
                index += 1
            }
            
            for (j in srt.first..dst.first - 1) {
                array[j][dst.second] = element[index]
                index += 1
            }
            
            for (j in dst.second downTo srt.second + 1) {
                array[dst.first][j] = element[index]
                index += 1
            }
            
            for (j in dst.first downTo srt.first + 1) {
                array[j][srt.second] = element[index]
                index += 1
            }
        }
        return answer
    }
}
