import Foundation

func solution(_ storey:Int) -> Int {
    var floor = storey
    var count = 0
    
    while floor > 0 {
        let first = floor % 10 // 일의 자리
        let second = (floor / 10) % 10 // 십의 자리
        
        if first > 5 {
            count += 10 - first
            floor += 10 // 십의 자리 올림
        } else if first == 5 {
            if second >= 5 {
                floor += 10 // 십의 자리 올림
            }
            count += 5
        } else {
            count += first
        }
        
        floor /= 10
    }
    
    return count
}