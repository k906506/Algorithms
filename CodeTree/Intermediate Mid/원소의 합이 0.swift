let n = Int(readLine()!)!
var numbers = [[Int]]()
var infos = [Int: Int]()
var result = 0

for _ in 0..<4 {
    numbers.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<n {
    for j in 0..<n {
        let sum = -(numbers[0][i] + numbers[1][j])

        if infos[sum] == nil {
            infos[sum] = 1
        } else {
            infos[sum] = infos[sum]! +  1
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        let sum = numbers[2][i] + numbers[3][j]

        if infos[sum] != nil {
            result += infos[sum]!
        } 
    }
}

print(result)