/*
INPUT
6
4 2 6 3 1 5
 
OUTPUT
3
*/

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [numbers[0]]

for i in 1..<n {
    if numbers[i] > dp.last! {
        dp.append(numbers[i])
    } else {
        let idx = lowerBound(dp, numbers[i])
        dp[idx] = numbers[i]
    }
}

print(dp.count)

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count
    var mid = 0
    
    while start < end {
        mid = (start + end) / 2
        
        if arr[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    return start
}
