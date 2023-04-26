let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var lines = [[Int]]()

for _ in 0..<inputs[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    lines.append([points[0], points[1]])
}

lines.sort(by: { $0[0] < $1[0] })

var start = 1
var end = lines.last![1] // 마지막 선분의 끝점
var mid = 0
var answer = 0

while start <= end {
    mid = (start + end) / 2 

    var cnt = 0
    for line in lines {
        var limit = line[0]
        while limit <= line[1] { // 현재 선분의 끝점에 도달할 떄까지 탐색
            cnt += 1
            limit += mid
        }
    }

    if cnt >= inputs[0] { // 두 점 사이의 거리를 늘릴 필요가 있음
        answer = max(answer, mid)
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(answer)