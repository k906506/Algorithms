let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var counts = [Int: Int]()
var right = 0
var answer = 0

for left in 0..<inputs[0] {
    while right < inputs[0], (counts[numbers[right]] == nil || counts[numbers[right]]! <= inputs[1]) {
        if counts[numbers[right]] == nil {
            counts[numbers[right]] = 1
        } else {
            if counts[numbers[right]]! == inputs[1] { break }

            counts[numbers[right]] = counts[numbers[right]]! + 1
        }

        right += 1
    }

    answer = max(answer, right - left)

    if counts[numbers[left]]! > 1 {
        counts[numbers[left]] = counts[numbers[left]]! - 1
    } else {
        counts[numbers[left]] = nil
    }
}

print(answer)