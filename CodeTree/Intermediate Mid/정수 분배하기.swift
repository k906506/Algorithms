/*
1. 1 ~ 가장 큰 n을 기준으로 parametric search를 진행
2. 주어진 정수 / mid 를 진행하고, m보다 작으면 더 잘게 나눠야하는 것이므로 범위를 줄이고, m보다 크면 범위를 늘린다
*/

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = [Int]()

for _ in 0..<inputs[0] {
    numbers.append(Int(readLine()!)!)
}

var start = 1
var end = numbers.max()!
var mid = 0
var answer = 0

while start <= end  {
    mid = (start + end) / 2

    var cnt = 0
    for number in numbers {
        cnt += (number / mid) // 몇 개의 정수를 만들 수 있는지 카운트
    }

    if cnt >= inputs[1] { // 최소 m개 이상 만들어야 하는 것이므로, 이 조건에서 값을 갱신
        answer = max(answer, mid)
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(answer)