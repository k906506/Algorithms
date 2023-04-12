let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var counts = [Int: Int]()
var result = 0

for number in numbers {
    if counts[number] == nil {
        counts[number] = 1
    } else {
        counts[number] = counts[number]! + 1
    }
}

// k도 Int 범위 이내, n도 1000 이하이므로 n^2 쌉가능
for i in 0..<inputs[0] {
    counts[numbers[i]] = counts[numbers[i]]! - 1 // 중복 제거

    for j in 0..<i {
        let key = inputs[1] - (numbers[i] + numbers[j])

        if counts[key] != nil {
            result += counts[key]!
        }
    }
}

print(result)