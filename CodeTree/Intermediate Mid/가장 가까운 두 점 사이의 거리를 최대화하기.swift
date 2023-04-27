/*
n개의 선분이 주어지고, n개의 점이 선택됐을 때, 두 점 사이의 거리가 최대화되는 지점을 찾는 문제
*/

let n = Int(readLine()!)!
var lines = [[Int]]()

for _ in 0..<n {
    lines.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

lines.sort(by: { $0[0] < $1[0] })

var start = 0
var end = lines.last![1] // 가장 멀리 있는 선분의 끝점
var mid = 0
var answer = 0

while start <= end {
    mid = (start + end) / 2

    var cnt = 0
    var last = Int.min
    for line in lines {
        last = max(last + mid, line[0])

        if last <= line[1] {
            cnt += 1
            continue
        } else { // 선분 위에 점을 택할 수 없으므로 종료
            break 
        }
    }

    if cnt >= n { // 두 점 사이의 거리를 늘려야하는 경우
        answer = max(answer, mid)
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(answer)