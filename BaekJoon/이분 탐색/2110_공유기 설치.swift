let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var houses = [Int]()

for _ in 0..<inputs[0] {
    houses.append(Int(readLine()!)!)
}

houses.sort(by: <) // 오름차순으로 정렬

// Parametric Search
var left = 0
var right = 2147483647
var ans = 2147483647

while left < right {
    let mid = (left + right) / 2

    var current = houses[0] // 첫 번째 집부터
    var cnt = 1
    for i in 1..<inputs[0] {
        if houses[i] - current >= mid {
            cnt += 1
            current = houses[i] // 기준이 되는 집을 변경
        }
    }

    if cnt >= inputs[1] { // 공유기를 더 많이 설치한 경우 -> 두 집 사이의 거리를 늘려야 함
        left = mid + 1
    } else { // 공유기를 더 조금 설치한 경우 -> 두 집 사이의 거리를 줄여야 함
        right = mid
    }
}

print(left - 1)