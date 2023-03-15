/*
10 15
5 1 3 5 10 7 4 9 2 8
*/

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var left = 0
var right = 0
var minLength = 100_000
var partSum = 0

while left <= right {
    if partSum >= info[1] {
        minLength = min(minLength, right - left)

        partSum -= numbers[left]
        left += 1
    } else if (right == info[0]) {
        break
    } else {
        partSum += numbers[right]
        right += 1
    }
}

print(minLength ==  100_000 ? 0 : minLength)