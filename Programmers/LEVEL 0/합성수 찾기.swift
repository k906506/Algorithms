import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = 0
    
    for i in 1...n {
        var cnt: Int = 0
        
        for j in 1...i {
            if i % j == 0 {
                cnt += 1
            }
            if cnt >= 3 {
                answer += 1
                break
            }
        }
    }
    
    return answer
}