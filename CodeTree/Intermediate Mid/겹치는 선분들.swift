let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = 0
var end = 0

var counts = [[Int]]() // 선분을 저장할 배열

for _ in 0..<inputs[0] {
    let command = readLine()!.split(separator: " ").map { String($0) }

    if command[1] == "R" {
        start = end 
        end = start + Int(command[0])!
    } else {
        start = end
        end = start - Int(command[0])!
    }
    
    //  start <-> end 이므로 start가 더 작아야함
    if start > end {
        counts.append([end, 1])
        counts.append([start, -1])
    } else {
        counts.append([start, 1])
        counts.append([end, -1])
    }
}

counts.sort(by: { $0[0] > $1[0] }) // removeLast를 위해 내림차순으로 정렬

var sum = 0
var answer = 0
var begin = Int.min
var check = false

while !counts.isEmpty {
    let point = counts.removeLast()
    sum += point[1]

    if sum >= inputs[1] {
        check = true

        if begin == Int.min {
            begin = point[0]
        }
    } else {
        if check {
            answer += abs(point[0] - begin)

            begin = Int.min
            check = false
        }
    }
}

print(answer)