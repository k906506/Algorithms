let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var sum = 0
var cnt = 0
var left = 0
var right = 0

for left in 0..<infos[0] {
    while right <= infos[0] - 1, sum < infos[1] {
        sum += numbers[right]
        right += 1
    }

    if sum == infos[1] {
        cnt += 1
    }

    sum -= numbers[left]
}

print(cnt)