/*
INPUT
6
10 20 10 30 20 50
 
OUTPUT
4
10 20 30 50
*/

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [numbers[0]]
var order = [0]
var ans = [Int]()

for i in 1..<numbers.count {
    if numbers[i] > dp.last! {
        dp.append(numbers[i])
        order.append(dp.count - 1)
    } else {
        let idx = lowerBound(dp, numbers[i])
        dp[idx] = numbers[i]
        order.append(idx)
    }
}

order.reverse()

var standard = dp.count - 1

for i in 0..<order.count {
    if standard == order[i] {
        let idx = n - i - 1
        
        ans.append(numbers[idx])
        standard -= 1
    }
}

print(ans.count)
print(ans.reversed().map { String($0) }.joined(separator: " "))

func lowerBound(_ array: [Int], _ target: Int) -> Int {
    var start = 0
    var end = array.count
    var mid = 0
    
    while start < end {
        mid = (start + end) / 2
        
        if array[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    return start
}