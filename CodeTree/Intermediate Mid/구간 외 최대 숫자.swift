let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var left = [Int](repeating: 0, count: inputs[0] + 2)
var right = [Int](repeating: 0, count: inputs[0] + 2)

// Left Max
for i in 1...inputs[0] {
    left[i] = max(left[i - 1], numbers[i - 1])
}

// Right Max
for i in stride(from: inputs[0], to: 0, by: -1) {
    right[i] = max(right[i + 1], numbers[i - 1])
}

for _ in 0..<inputs[1] {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    print(max(left[infos[0] - 1], right[infos[1] + 1]))
}