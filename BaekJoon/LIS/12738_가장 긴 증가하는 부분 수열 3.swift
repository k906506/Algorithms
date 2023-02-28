/*
INPUT
6
10 20 10 30 20 50
 
OUTPUT
4
*/

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [numbers[0]]

for i in 1..<numbers.count {
    if numbers[i] > dp.last! {
        dp.append(numbers[i])
    } else {
        let idx = lowerBound(dp, numbers[i])
        dp[idx] = numbers[i]
    }
}

print(dp.count)

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