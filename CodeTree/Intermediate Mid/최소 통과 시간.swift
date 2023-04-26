/*
걸리는 시간을 가정하고, 문제를 접근
최대 시간은 가장 오래 걸리는 통로로 n개의 물건이 모두 지나갔을 떄이므로 n * m
*/

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var paths = [Int]()

for _ in 0..<inputs[1] {
    paths.append(Int(readLine()!)!)
}

paths.sort(by: < ) // 오름차순으로 정렬

var start = 1
var end = paths.last! * inputs[0]
var mid = 0
var answer = Int.max

while start <= end {
    mid = (start + end) / 2 

    var item = 0

    for path in paths {
        item += mid / path
    }

    if item >= inputs[0] { // 다 통과할 수 있는 시간이므로 시간을 줄임
        answer = min(answer, mid)
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(answer)
