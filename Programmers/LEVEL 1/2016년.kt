class Solution {
    fun solution(a: Int, b: Int): String {
        var answer = ""
        var totalDay = b - 1
        
        if (a != 1) {
            for (month in 1..a-1) {
                when (month) {
                    1, 3, 5, 7, 8, 10, 12 -> totalDay += 31
                    2 -> totalDay += 29
                    else -> totalDay += 30
                }
            }
        }
        
        totalDay %= 7
        
        when (totalDay) {
            0 -> answer = "FRI"
            1 -> answer = "SAT"
            2 -> answer = "SUN"
            3 -> answer = "MON"
            4 -> answer = "TUE"
            5 -> answer = "WED"
            6 -> answer = "THU"
        }
        
        return answer
    }
}
