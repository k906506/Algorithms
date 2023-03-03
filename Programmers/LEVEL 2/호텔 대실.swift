import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var schedules = [[Int]]()
    
    for time in book_time {
        let startTime = time[0].split(separator: ":").map { Int(String($0))! }
        let endTime = time[1].split(separator: ":").map { Int(String($0))! }
        schedules.append([startTime[0] * 60 + startTime[1], endTime[0] * 60 + endTime[1]])
    }

    var count = [Int](repeating: 0, count: 24 * 60 + 10)
    
    for schedule in schedules {
        for time in schedule[0]..<schedule[1] + 10 {
            count[time] += 1
        }
    }
    
    return count.sorted(by: >).first!
}