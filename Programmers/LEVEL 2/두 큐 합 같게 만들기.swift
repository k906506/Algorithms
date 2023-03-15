import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let array = queue1 + queue2
    var start = 0
    var end = queue1.count
    
    var sumOfQueue1 = queue1.reduce(0, +)
    let sumOfQueue2 = queue2.reduce(0, +)
    let goal = (sumOfQueue1 + sumOfQueue2) / 2
    
    var cnt = 0
    
    while start <= end, end < array.count {        
        if goal > sumOfQueue1 {
            sumOfQueue1 += array[end]
            end += 1
            cnt += 1
        } else if goal < sumOfQueue1 {
            sumOfQueue1 -= array[start]
            start += 1
            cnt += 1
        } else {
            break
        }
    }
    
    if sumOfQueue1 != goal {
        return -1
    }
    
    return cnt
}