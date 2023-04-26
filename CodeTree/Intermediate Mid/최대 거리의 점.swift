/*
1. 거리를 가정하고 parametric search를 진행
2. 최소 거리니까 탐색하면서 거리가 mid보다 크거나 같을 떄를 카운트
3. 이 값이 m보다 크면 최소 거리를 증가
4. 이 값이 m보다 작으면 최소 거리를 감소
*/

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = [Int]()

for _ in 0..<inputs[0] {
    numbers.append(Int(readLine()!)!)
}

// 정렬되어서 주어진다는 말이 없으니까 일단 정렬
numbers.sort(by: < )

var start = 1
var end = numbers.last!
var mid = 0
var answer = 0

while start <= end {
    mid = (start + end) / 2 // 가장 인접한 두 물건의 거리의 최댓값을 가정

    var cnt = 1
    var index = 0
    for i in 1..<inputs[0] {
        if numbers[i] - numbers[index] >= mid {
            cnt += 1 // 새롭게 설치하고
            index = i // 해당 위치를 기록
        }
    }

    if cnt >= inputs[1] { // 거리를 더 늘려도 되는 경우
        answer = max(answer, mid)
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(answer)