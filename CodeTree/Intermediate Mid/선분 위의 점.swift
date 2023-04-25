let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var points = readLine()!.split(separator: " ").map { Int(String($0))! }

points.sort(by: <) // points가 정렬되어 있지 않으므로 오름차순으로 정렬

for _ in 0..<inputs[1] {
    let lines = readLine()!.split(separator: " ").map { Int(String($0))! }

    let src = lowerBound(points, lines[0])
    let dst = upperBound(points, lines[1])

    print(dst - src)
}

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count
    var mid = 0

    while start < end {
        mid = (start + end) / 2

        if arr[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

func upperBound(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count
    var mid = 0

    while start < end {
        mid = (start + end) / 2

        if arr[mid] > target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}