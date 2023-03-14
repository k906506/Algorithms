import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var infos = [String: [Int]]()

    for record in records {
        let info = record.split(separator: " ").map { String($0) }
        let times = info[0].split(separator: ":").map { Int(String($0))! }
        let minutes = times[0] * 60 + times[1]
        let number = info[1]
        let type = info[2]

        if type == "IN" {
            if infos[number] == nil {
                infos[number] = [minutes, -1, 0]
            } else {
                infos[number] = [minutes, infos[number]![1], infos[number]![2]]
            }
        } else { // IN이 항상 먼저 들어옴
            infos[number] = [infos[number]![0], minutes, infos[number]![2] + (minutes - infos[number]![0])]
        }
    }

    return calculateFees(infos, fees)
}

func calculateFees(_ infos: [String: [Int]], _ fees: [Int]) -> [Int] {
    var result = [Int]()
    var numbers = infos.keys.sorted()

    for number in numbers {
        var sum = 0
        var time = 0

        if infos[number]![0] > infos[number]![1] { // 아직 주차장 안에 있는 경우 (출차 X)
            time += infos[number]![2]
            time += (1439 - infos[number]![0]) // 23:59 = 1439(분)
        } else {
            time += infos[number]![2]
        }

        if time > fees[0] {
            sum += fees[1]

            time -= fees[0] // 기본 시간 제외하고

            if time % fees[2] == 0 {
                sum += ((time / fees[2]) * fees[3]) // 단위 시간으로 나누고, 단위 요금 곱하고
            } else { // 나누어 떨어지지 않을 경우 올림
                sum += (((time / fees[2]) + 1) * fees[3]) // 단위 시간으로 나누고, 단위 요금 곱하고
            }

            result.append(sum)
        } else { // 기본 요금만
            result.append(fees[1])
        }
    }

    return result
}