import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var infos = [String: Int]()
    var result = [Int]()
    
    for term in terms {
        let temp = term.split(separator: " ").map { String($0) }
        infos[temp[0]] = Int(temp[1])! * 28 // 일자로 변경
    }
    
    let splitToday = today.split(separator: ".").map { Int(String($0))! }
    
    for (index, privacie) in privacies.enumerated() {
        let temp = privacie.split(separator: " ").map { String($0) }
        let splitDate = temp[0].split(separator: ".").map { Int(String($0))! }
        
        let years = splitToday[0] - splitDate[0]
        var months = splitToday[1] - splitDate[1]
        var dates = splitToday[2] - splitDate[2]
        
        if years < 0 { continue }
        
        months += years * 12 // 연 -> 달
        dates += months * 28 // 달 -> 일
        dates += 1
        
        if dates > infos[temp[1]]! {
            result.append(index + 1)
        }
    }
    
    return result
}