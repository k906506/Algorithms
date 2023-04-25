let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let queries = readLine()!.split(separator: " ").map { Int(String($0))! }

for query in queries {
    let index = lowerBound(numbers, query)

    if index < inputs[0] {
        if numbers[index] == query {
            print(index + 1)
        } else {
            print(-1)
        }
    } else {
        print(-1)
    }
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