let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var lines = [[Int]]()

for _ in 0..<inputs[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }

    lines.append([points[0], points[1]])
}

lines.sort(by: { $0[0] < $1[0] })

var start = 0
var end = lines.last![1] // 마지막 선분의 끝점
var mid = 0
var answer = 0

while start <= end {
    mid = (start + end) / 2 

    var cnt = 0
    var last = Int.min
    for line in lines {
        while last + mid <= line[1] { // 직전 좌표 + 최소 거리가 선분의 끝점보다 작을 떄 (이동 가능한 경우)
            cnt += 1
            last = max(line[0], last + mid)

            if cnt >= inputs[0] { // n보다 커지면 반복문을 더 수행할 필요가 없음
                break
            }
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