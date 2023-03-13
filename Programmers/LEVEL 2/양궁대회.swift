import Foundation

var gap = 0
var answer = [-1]

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let lion = [Int](repeating: 0, count: 11)
    let visited = [Bool](repeating: false, count: 11)
    
    dfs(n, info, lion, visited, n)
    
    return answer
}

func dfs(_ n: Int, _ apeach: [Int], _ lion: [Int], _ visited: [Bool], _ leftover: Int) {
    if leftover <= 0 {
        let result = gapOfArrays(n, apeach, lion) 
        
        if gap <= result {
            if result == 0 { return } // 23번 테스트 케이스
            
            gap = result
            answer = lion
        }
        
        return
    }
    
    var tempLion = lion
    var tempVisited = visited
    
    for idx in 0...10 {
        if idx == 10 { // 중요... 이 조건 때문에... 헤맸다...
            tempLion[idx] += leftover
            dfs(n, apeach, tempLion, tempVisited, leftover - (tempLion[idx]))
            tempLion[idx] -= leftover
        }
        
        if !tempVisited[idx], apeach[idx] < leftover {
            tempVisited[idx] = true
            tempLion[idx] += (apeach[idx] + 1)
            
            dfs(n, apeach, tempLion, tempVisited, leftover - (tempLion[idx]))
            
            tempLion[idx] -= (apeach[idx] + 1)
            tempVisited[idx] = false
        }
    }
}

func gapOfArrays(_ n: Int, _ apeach: [Int], _ lion: [Int]) -> Int {
    var totalOfApeach = 0
    var totalOfLion = 0
    
    for i in 0...10 {
        if apeach[i] == 0, lion[i] == 0 { continue }
        
        if apeach[i] >= lion[i] { totalOfApeach += (10 - i) }
        else if apeach[i] < lion[i] { totalOfLion += (10 - i) }
    }
    
    return totalOfLion - totalOfApeach
}