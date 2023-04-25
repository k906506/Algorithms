let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 0..<inputs[1] {
    let index = binarySearch(numbers, Int(readLine()!)!)

    print(index <= -1 ? -1 : index + 1)
}

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    var mid = 0

    while start <= end {
        mid = (start + end) / 2

        if arr[mid] > target {
            end = mid - 1
        } else if arr[mid] < target {
            start = mid + 1
        } else {
            return mid
        }
    }

    return -1
}