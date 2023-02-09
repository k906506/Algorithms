import Foundation

var gears: [[Int]] = []
var isRotated: [Int] = [0, 0, 0, 0]

for _ in 0..<4 {
    gears.append(readLine()!.map { Int(String($0))! })
}

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    moveGears(input[1], input[0] - 1)
}

var sum = 0
var pow = 1

for i in 0..<4 {
    if gears[i][0] == 1 {
        sum += pow
    }
    
    pow *= 2
}

print(sum)

func moveGears(_ direction: Int, _ index: Int) {
    isRotated = [0, 0, 0, 0] // 회전 가능 여부 초기화
    isRotated[index] = direction
    
    checkLeftGear(direction, index)
    checkRightGear(direction, index)
    
    for i in 0..<4 {
        moveGear(isRotated[i], i)
    }
}

func moveGear(_ direction: Int, _ index: Int) {
    if direction == 1 { // 시계 방향으로 회전
        gears[index] = [gears[index].last!] + gears[index][0..<7]
    } else if (direction == -1 ){
        gears[index] = gears[index][1..<8] + [gears[index].first!]
    }
}

func checkLeftGear(_ direction: Int, _ index: Int) {
    if index <= 0 { return }
    if gears[index][6] != gears[index - 1][2] {
        isRotated[index - 1] = -1 * direction // 서로 다른 방향으로 이동
        checkLeftGear(-1 * direction, index - 1)
    }
}

func checkRightGear(_ direction: Int, _ index: Int) {
    if index >= 3 { return }
    if gears[index][2] != gears[index + 1][6] {
        isRotated[index + 1] = -1 * direction // 서로 다른 방향으로 이동
        checkRightGear(-1 * direction, index + 1)
    }
}