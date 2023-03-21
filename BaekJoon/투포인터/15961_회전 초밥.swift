let info = readLine()!.split(separator: " ").map { Int(String($0))! }
var sushis = [Int]()

for _ in 0..<info[0] {
    sushis.append(Int(readLine()!)!)
}

var eaten = [Int](repeating: 0, count: info[1] + 1)
var result = 0

for i in 0..<info[0] {
    for j in i..<i + info[2] {
        if eaten[sushis[j]] != 0 { // 이미 먹음
            break
        } else {
            eaten[sushis[j]] = 1
        }

        if eaten[info[3]] == 0 {
            result = info[2] + 1
        } else {
            result = info[2]
        }
    }

    // 먹은 접시 초기화
    for j in i..<i + info[2] {
        eaten[sushis[j]] = 0
    }

    eaten[info[3]] == 0
}