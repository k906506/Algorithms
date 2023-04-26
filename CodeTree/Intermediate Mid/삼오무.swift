let n = Int(readLine()!)!

var start = 1
var end = Int(1e10)
var mid = 0
var answer = Int(1e10)

while start <= end {
    mid = (start + end) / 2

    if check(mid) >= n { // 범위를 더 줄여야 함
        answer = min(answer, mid)
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(answer)

func check(_ num: Int) -> Int {
    let count = num / 3 + num / 5 - num / 15
    return num - count
}