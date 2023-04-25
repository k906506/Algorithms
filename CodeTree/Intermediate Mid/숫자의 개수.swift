let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

for _ in 0..<inputs[1] {
    let target = Int(readLine()!)!

    print(upperBound(numbers, target) - lowerBound(numbers, target))
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