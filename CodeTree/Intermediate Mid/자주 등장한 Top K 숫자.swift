let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var counts = [Int: Int]()

for number in numbers {
    if counts[number] == nil {
        counts[number] = 1
    } else {
        counts[number] = counts[number]! + 1
    }
}

var temp = Array(zip(counts.keys, counts.values))
temp.sort(by: { e1, e2 in
    if e1.1 > e2.1 { return true }
    else if e1.1 < e2.1 { return false }
    else {
        if e1.0 > e2.0 { return true }
        else { return false }
    }
})

for i in 0..<infos[1] {
    print(temp[i].0, terminator: " ")
}