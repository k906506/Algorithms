import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var answer: [[Int]] = []
    
    for i in 0..<(num_list.count / n) {
        var temp: [Int] = []
        for j in 0..<n {
            temp.append(num_list[n * i + j])
        }
        answer.append(temp)
    }
    
    return answer
}