let n = Int(readLine()!)!
var minDp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var maxDp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var arr = minDp

for i in 0..<n {
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    arr[i][0] = inputs[0]
    arr[i][1] = inputs[1]
    arr[i][2] = inputs[2]
    
    if i == 0 {
        minDp[i][0] = arr[i][0]
        minDp[i][1] = arr[i][1]
        minDp[i][2] = arr[i][2]
        
        maxDp[i][0] = arr[i][0]
        maxDp[i][1] = arr[i][1]
        maxDp[i][2] = arr[i][2]
    } else {
        for j in 0...2 {
            if j == 0 {
                minDp[i][j] = arr[i][j] + min(minDp[i - 1][j], minDp[i - 1][j + 1])
                maxDp[i][j] = arr[i][j] + max(maxDp[i - 1][j], maxDp[i - 1][j + 1])
            } else if j == 1 {
                minDp[i][j] = arr[i][j] + min(min(minDp[i - 1][j - 1], minDp[i - 1][j]), minDp[i - 1][j + 1])
                maxDp[i][j] = arr[i][j] + max(max(maxDp[i - 1][j - 1], maxDp[i - 1][j]), maxDp[i - 1][j + 1])
            } else {
                minDp[i][j] = arr[i][j] + min(minDp[i - 1][j], minDp[i - 1][j - 1])
                maxDp[i][j] = arr[i][j] + max(maxDp[i - 1][j], maxDp[i - 1][j - 1])
            }
        }
    }
}

let ansMax = maxDp[n - 1].sorted(by: >)
let ansMin = minDp[n - 1].sorted(by: <)

print(ansMax[0], ansMin[0])