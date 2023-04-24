// 1 이상이 되는 시점부터 길이를 측정하고, 0이 되면 길이 측정을 종료한다.
// 이전 문제와 동일하되, 최대 값만을 저장한다.
let n = Int(readLine()!)!
var infos = [[Int]]()

for _ in 0..<n {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    infos.append([points[0], 1])
    infos.append([points[1], -1])
}

infos.sort(by: { $0[0] > $1[0] }) // removeLast를 위해 내림차순으로 정렬

var sum = 0
var check = false
var start = 0
var answer = 0
while !infos.isEmpty {
    let points = infos.removeLast()

    sum += points[1]

    if sum > 0 {
        if !check {
            start = points[0] // 현재 지점부터 길이 측정 시작
            check = true
        }
    } else {
        if check {
            answer = max(answer, abs(start - points[0])) // 측정 시작한 길이부터 현재 지점까지 길이 계산, 이후 비교
            check = false
        }
    }
}

print(answer)