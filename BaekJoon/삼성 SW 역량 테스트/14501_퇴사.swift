import Foundation

let n = Int(readLine()!)!

var a = [Int](repeating: 0, count: n + 2)
var t = [Int](repeating: 0, count: n + 2)
var p = [Int](repeating: 0, count: n + 2)
var ans = 0

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    t[i] = input[0]
    p[i] = input[1]
}

for i in 1...n + 1 {
    for j in 1..<i {
        if (j + t[j] == i) {
            a[i] = max(a[i], a[j] + p[j])
        } else {
            a[i] = max(a[i], a[j])
        }
    }
    
    ans = max(ans, a[i])
}

print(ans)
