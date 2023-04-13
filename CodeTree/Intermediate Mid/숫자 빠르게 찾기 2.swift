let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.sort(by: <)

for _ in 0..<infos[1] {
    let target = Int(readLine()!)!
    let index = upperBound(arr, target)

    if index >= infos[0] {
        print(-1)
    } else {
        print(arr[index])
    }
}

func upperBound(_ arr: [Int], _ target: Int) -> Int {
    var left = 0
    var right = arr.count
    var mid = 0

    while left < right {
        mid = (left + right) / 2

        if arr[mid] >= target {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}