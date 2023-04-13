let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let maxLength = inputs.reduce(0, +)

var arr1 = [String](repeating: "", count: maxLength)
var arr2 = [String](repeating: "", count: maxLength)

var s1 = readLine()!.map { String($0) }
var s2 = readLine()!.map { String($0) }

s1.reverse()

for i in 0..<s1.count {
    arr1[i] = s1[i]
}

for i in 0..<s2.count {
    arr2[i + inputs[0]] = s2[i]
}

let time = Int(readLine()!)!
var already = ""

for _ in 0..<time {
    for i in 0..<maxLength - 1 {
        if arr1[i] != "", arr2[i + 1] != "", arr1[i] != already {
            already = arr1[i]
            
            arr1.swapAt(i, i + 1)
            arr2.swapAt(i, i + 1)
        }
    }
    
    already = "" // 한 턴 돌고 초기화!
}

for i in 0..<maxLength {
    if arr1[i] != "" {
        print(arr1[i], terminator: "")
    } else {
        print(arr2[i], terminator: "")
    }
}
