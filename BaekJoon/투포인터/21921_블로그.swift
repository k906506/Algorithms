import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let members = readLine()!.split(separator: " ").map { Int(String($0))! }

if input[0] == input[1] {
    print(members.reduce(0, +))
    print(1)
    exit(0)
}

var dp = [Int](repeating: 0, count: input[0] + 1)
var sum = 0

for i in 1...input[0] {
    dp[i] += sum + members[i - 1]
    sum += members[i - 1]
}

var result = 0
var info = [Int: Int]()

for i in input[1]...input[0] {
    let gap = dp[i] - dp[i - input[1]]
    
    result = max(result, gap)
    
    if info[gap] == nil {
        info[gap] = 1
    } else {
        info[gap] = info[gap]! + 1
    }
}

if result == 0 {
    print("SAD")
} else {
    print(result)
    print(info[result]!)
}
