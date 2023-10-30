import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var histories = [String: String]()
    var lastChar = words[0][0]
    var cnt = 0
    var answer = [0, 0]
    
    // 탈락자가 발생하면 종료
    for i in 0..<words.count {
        if histories[words[i]] != nil || lastChar != words[i][0] {
            answer = [i % n + 1, cnt / n + 1]
            break
        } else {
            histories[words[i]] = words[i]
            lastChar = words[i][words[i].count - 1]
        }
        
        cnt += 1
    }
    
    // 탈락자가 발생하지 않는 경우
    return answer
}

extension String {
    subscript(_ index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
    }
}