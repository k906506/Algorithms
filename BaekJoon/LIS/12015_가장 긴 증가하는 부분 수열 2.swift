let n = Int(readLine()!)!
let numbers = readLine().split(separator: " ").map { Int(String($0))! }
var dp = [Int]()

dp.append(numbers[0])

for i in 1..<numbers.count {
    if numbers[i] > dp.last! {
        dp.append(numbers[i])
    } else {
        let index = lowerBound(array: array, target: numbers[i])
        dp[index] = numbers[i]
    }
}

print(dp)

func lowerBound(array: [Int], target: Int) -> Int {
    var start = 0
    var end = array.count
    var mid = 0

    while start < end {
        mid = (start + end) / 2

        if array[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}