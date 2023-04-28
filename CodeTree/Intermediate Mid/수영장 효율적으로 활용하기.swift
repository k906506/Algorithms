// 임의의 이용 시간을 잡고, Parametric Search
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let times = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = 1440 * inputs[0]
var answer = Int.max

while left <= right {
    var mid = (left + right) / 2

    if isPossible(mid) { // 시간을 더 줄여도 되는 경우
        right = mid - 1
        answer = min(answer, mid)
    } else { 
        left = mid + 1
    }
}

print(answer)


func isPossible(_ mid: Int) -> Bool {
    var sum = 0
    var cnt = 1

    for time in times {
        if time > mid { // 최소 시간보다 이용 시간이 크므로, 범위를 더 늘려야 함
            return false 
        } else {
            if sum + time <= mid {
                sum += time
            } else {
                cnt += 1
                sum = time
            }
        }

        if cnt > inputs[1] {
            return false
        }
    }

    return true
}