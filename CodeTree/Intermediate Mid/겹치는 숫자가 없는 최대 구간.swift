let n = Int(readLine()!)!
var numbers = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var counts = [Int](repeating: 0, count: 100001)

var right = 0
var ans = 0

for left in 1..<n + 1 {
    while right + 1 <= n, counts[numbers[right + 1]] < 1 {
        counts[numbers[right + 1]] += 1
        right += 1
    }

    ans = max(ans, right - left + 1)

    counts[numbers[left]] -= 1
}

print(ans)