let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = Int.max
var sum = 0
var left = 0
var right = 0

while true {
    if sum >= infos[1] {
        ans = min(ans, right - left)
        sum -= numbers[left]
        left += 1 // left 이동
    } else { // right를 이동해야하는 경우
        if right < infos[0] { 
            sum += numbers[right]
            right += 1
        } else { // right를 이동해야하는데 이동할 수 없다? -> 종료
            break
        }
    }

    if left == infos[0] { break } // 종료
}

print(ans == Int.max ? -1 : ans)