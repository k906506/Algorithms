import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var notPainted = section
    var end = 0
    var cnt = 0
    
    while !notPainted.isEmpty {
        var area = notPainted.removeFirst()
        
        if end >= area {
            continue
        } else {
            end = area + m - 1 // 시작 지점 + 롤러의 길이 - 1
            cnt += 1
        }
    }
    
    return cnt
}