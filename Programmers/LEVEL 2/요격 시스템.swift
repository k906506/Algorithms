import Foundation

func solution(_ targets:[[Int]]) -> Int {
    // 1. 멀리 있는 좌표 순으로 내림차순으로 정렬
    // 2. 하나씩 제거해가면서 겹치는게 없으면 Count + 1

    var tempTargets = targets.sorted(by: { $0[1] > $1[1] })
    var timeSliced = [0, 0]
    var count = 0

    for target in tempTargets {
        if timeSliced[0] >= target[1] || timeSliced[1] == 0 {
            timeSliced = target
            count += 1
        } else {
            timeSliced = [max(timeSliced[0], target[0]), min(timeSliced[1], target[1])]
        }
    }

    return count
    
    // var tempTargets = targets.sorted(by: { $0[1] < $1[1] })
    // var end = -1
    // var count = 0
    
    // for target in tempTargets {
    //     if end <= target[0] {
    //         end = target[1]
    //         count += 1
    //     }
    // }
    
    // return count
}