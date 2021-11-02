class Solution {
    fun solution(sizes: Array<IntArray>): Int {
        var answer: Int = 0
        var maxHeight = 0
        var maxWidth = 0
        
       for (e in sizes) { // e[0]은 height, e[1]은 width로 가정
           if (e[0] < e[1]) { // 기본적으로 높이가 크게 조정
               var temp = e[0]
               e[0] = e[1]
               e[1] = temp
           }
           if (e[0] > maxHeight) {
               maxHeight = e[0]
           }
           if (e[1] > maxWidth) {
               maxWidth = e[1]
           }
       }
       
       return maxHeight * maxWidth
    }
}
