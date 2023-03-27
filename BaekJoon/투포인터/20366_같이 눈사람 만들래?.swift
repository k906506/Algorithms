let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = Int.max

numbers.sort(by: <) // 오름차순으로 정렬

for i in 0..<n-1 {
    for j in stride(from: n - 1, through: i + 1, by: -1) {
        makeSnowman(i, j, n, numbers)
    }
}

func makeSnowman(_ i: Int, _ j: Int, _ n: Int, _ arr: [Int]) {
    var start = i + 1
    var end = j - 1

    while start < end {
        let elsa = arr[i] + arr[j]
        let anna = arr[start] + arr[end]

        result = min(result, abs(elsa - anna))

        if elsa - anna > 0 { // 안나가 더 작은 경우, 안나를 더 크게 함
            start += 1
        } else { // 안나가 더 큰 경우, 안나를 더 작게 함
            end -= 1
        }
    }
}

print(result)