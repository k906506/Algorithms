let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr2 = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [Int]()
var left = 0
var right = 0
var status = 0

while true {
    if left == arr1.count {
        status = 1
        break
    } else if right == arr2.count {
        status = 0
        break
    }

    if arr1[left] > arr2[right] {
        result.append(arr2[right])
        right += 1
    } else if arr1[left] < arr2[right] {
        result.append(arr1[left])
        left += 1
    } else {
        result.append(arr1[left])
        result.append(arr2[right])
        left += 1
        right += 1
    }
}

if status == 0 {
    result.append(contentsOf: arr1[left..<arr1.count])
} else {
    result.append(contentsOf: arr2[right..<arr2.count])
}

print(result.map { String($0) }.joined(separator: " "))