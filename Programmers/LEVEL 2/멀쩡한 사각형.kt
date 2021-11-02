class Solution {
    fun gcd(a : Long, b : Long) : Long {
        if (b == 0.toLong()) {
            return a
        } else { 
            return gcd(b, a%b)
        }
    }
    
    fun solution(w: Int, h: Int): Long {
        var answer: Long = 0
        
        var big : Long = 0
        var small : Long = 0
        
        if (w > h) {
            big = w.toLong()
            small = h.toLong()
        } else { 
            big = h.toLong()
            small = w.toLong()
        }
        
        answer = big * small - (big + small - gcd(big, small))
 
        return answer
    }
}
