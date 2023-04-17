let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
var baskets = [(Int, Int)]()
var sum = 0
var answer = 0

for _ in 0..<infos[0] {
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }

    baskets.append((inputs[1], inputs[0])) // 위치와 사탕의 개수
}

baskets.sort(by: { $0.0 < $1.0} )

var right = 0

for left in 0..<infos[0] {
    while right <= infos[0] - 1, baskets[right].0 - baskets[left].0 <= 2 * infos[1] {
        sum += baskets[right].1
        right += 1
    }

    answer = max(answer, sum)

    sum -= baskets[left].1
}

print(answer)