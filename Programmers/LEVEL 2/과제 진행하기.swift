import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var newPlans = [[String]]()
    var stack = [(String, Int)]()
    var answer = [String]()
    
    for plan in plans {
        let startTime = plan[1].split(separator: ":").map { Int(String($0))! } 
        let newPlan = [plan[0], String(startTime[0] * 60 + startTime[1]), String(startTime[0] * 60 + startTime[1] + Int(plan[2])!)]
        newPlans.append(newPlan)
    }
    
    newPlans.sort(by: { Int($0[1])! < Int($1[1])! }) // 빠른 시각, 오름차순으로 정렬
    
    for i in 0..<newPlans.count - 1 {
        var remainTime = Int(newPlans[i + 1][1])! - Int(newPlans[i][2])! // 다음 과제의 시작 시간 - 현재 과제의 종료 시간
        
        if remainTime < 0 { // 현재 과제 미완료
            stack.append((newPlans[i][0], Int(newPlans[i][2])! - Int(newPlans[i + 1][1])!))
        } else { // 현재 과제 완료
            answer.append(newPlans[i][0])
        }
        
        while remainTime > 0, !stack.isEmpty { 
            let subject = stack.removeLast()
            
            if remainTime >= subject.1 { // 현재 과제 완료
                answer.append(subject.0)
                remainTime -= subject.1
            } else { // 현재 과제 미완료
                stack.append((subject.0, subject.1 - remainTime))
                remainTime = 0
            }
        }
    }
    
    answer.append(newPlans.last![0]) // 마지막 과제 
    
    // 남은 과제
    while !stack.isEmpty {
        let subject = stack.removeLast()
        
        answer.append(subject.0)
    }
    
    return answer
}