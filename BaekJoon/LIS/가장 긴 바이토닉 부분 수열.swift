let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

func getAscendLength(_ arr: [Int]) -> Int {
    var ascend = [arr[0]]

    for i in 1..<arr.count {
        if arr[i] > ascend.last! {
            ascend.append(numbers[i])
        } else {
            let index = lowerBound(ascend, arr[i]) 
            ascend[index] = arr[i]
        }
    }

    return ascend.count
}

func getDescendLength(_ arr: [Int]) -> Int {
    var descend = [arr[0]]

    for i in 1..<arr.count {
        if arr[i] > ascend.last! {
            ascend.append(numbers[i])
        } else {
            let index = lowerBound(ascend, arr[i]) 
            ascend[index] = arr[i]
        }
    }

    return ascend.count
}

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var left = 0
    var right = arr.count
    
    while left < right {
        let mid = (left + right) / 2

        if arr[mid] >= target { // 이미 범위 내에 있으므로 더 줄여봄
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

for i in 0..<n {
    let ascend = getAscendLength(number[0..<i + 1])
    let descend = getDescendLength(number[i + 1..<n].reversed)

    print(ascend + descend)
}