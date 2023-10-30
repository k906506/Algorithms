let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let arrA = readLine()!.split(separator: " ").map { Int(String($0))! }
let arrB = readLine()!.split(separator: " ").map { Int(String($0))! }
var right = 0

for left in 0..<inputs[0] {
    if right >= arrB.count { break }
    
    if arrA[left] == arrB[right] {
        right += 1
    }
}

print(right == arrB.count ? "Yes" : "No")