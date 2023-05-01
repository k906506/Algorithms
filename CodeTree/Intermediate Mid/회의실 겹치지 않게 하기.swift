let n = Int(readLine()!)!
var times = [[Int]]()

for _ in 0..<n {
    times.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

times.sort(by: { $0[1] < $1[1]} ) // 끝나는 시간의 오름차순으로 정렬

var end = 0
var answer = 0

for time in times {
    if time[0] >= end {
        end = time[1] // 종료시간 갱신
        answer += 1
    }
}

print(n - answer)