import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var infos = [String: Int]()
    var result = [Int]()
    
    for i in 0..<name.count {
        infos[name[i]] = yearning[i]
    }
    
    for e in photo {
        var sum = 0
        
        for person in e {
            if infos[person] != nil {
                sum += infos[person]!
            }
        }
        
        result.append(sum)
    }
    
    return result
}