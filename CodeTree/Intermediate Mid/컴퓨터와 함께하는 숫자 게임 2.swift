let m = Int64(readLine()!)!
let inputs = readLine()!.split(separator: " ").map { Int64(String($0))! }
var minValue = Int.max
var maxValue = Int.min

for i in inputs[0]...inputs[1] {
    let cnt = binarySearch(i, m)

    minValue = min(minValue, cnt)
    maxValue = max(maxValue, cnt)
}

print(minValue, maxValue)

func binarySearch(_ target: Int64, _ m: Int64) -> Int {
    var start: Int64 = 1
    var end: Int64 = m
    var mid: Int64 = 0
    var cnt = 0
    
    while start <= end {
        mid = (start + end) / 2
        cnt += 1

        if mid > target {
            end = mid - 1
        } else if mid < target {
            start = mid + 1
        } else {
            return cnt
        }
    }

    return cnt
}