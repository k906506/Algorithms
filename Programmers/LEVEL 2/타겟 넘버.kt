class Solution {
    fun solution(numbers: IntArray, target: Int): Int {
        var answer = 0
        
//        1. BFS를 활용한 풀이
//        var sums = mutableListOf<Int>()
//
//
//        sums.add(0)
//
//        for (number in numbers) {
//            var part_sums = mutableListOf<Int>()
//            for (part_sum in sums) {
//                part_sums.add(part_sum + number)
//                part_sums.add(part_sum - number)
//            }
//            sums = part_sums
//        }
//
//        for (number in sums.iterator()) {
//            if (number == target) {
//                answer += 1
//            }
//        }
//
//        return answer

//      2. DFS를 활용한 풀이
        var n = numbers.size

        fun dfs(index: Int, result: Int) {
            if (index == n) {
                if (result == target) {
                    answer += 1
                    return
                }
            } else {
                dfs(index + 1, result + numbers[index])
                dfs(index + 1, result - numbers[index])
            }
        }

        dfs(0, 0)
        return answer
    }
}
