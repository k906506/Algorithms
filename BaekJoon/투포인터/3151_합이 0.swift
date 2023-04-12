let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var infos = [Int: Int]()
var result = 0

for number in numbers {
    if infos[number] != nil {
        infos[number] = infos[number]! + 1
    } else {
        infos[number] = 1
    }
}

for i in 0..<n {
    infos[numbers[i]] = infos[numbers[i]]! - 1 // 중복 제거
    
    for j in 0..<i {
        let sum = -(numbers[i] + numbers[j])
        
        if infos[sum] != nil {
            result += infos[sum]!
        }
    }
}

print(result)
