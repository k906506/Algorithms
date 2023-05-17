// 차이가 m 이상이면서 차이가 가장 작으려면 lowerbound(m)
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = [Int]()

for _ in 0..<inputs[0] {
    numbers.append(Int(readLine()!)!)
}

var ans = -1
for number in numbers {
    let idx = lowerBound(numbers, number + inputs[1])

    if idx == inputs[0] {
        continue
    } else {
        ans = max(ans, numbers[idx] - number)
    }
}

print(ans)

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var left = 0
    var right = arr.count

    while left < right {
        let mid = (left + right) / 2

        if arr[mid] >= target {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}
