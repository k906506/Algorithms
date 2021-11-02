class Solution {
    fun solution(nums: IntArray): Int {
        var answer = 0
        for (i in 0..nums.size - 3) {
            for (j in i + 1..nums.size - 2) {
                for (k in j + 1..nums.size - 1) {
                    var temp : Int = nums[i] + nums[j] + nums[k]
                    if (checkPrime(temp)) answer += 1
                }
                
            }
        }
        return answer
    }
    
    fun checkPrime(number : Int) : Boolean {
        for (i in 2..number - 1) {
            if (number % i == 0) {
                return false
            }
        }
        return true
    }
}
