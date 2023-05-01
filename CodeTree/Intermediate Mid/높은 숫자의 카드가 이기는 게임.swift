let n = Int(readLine()!)!
var a_cards = [Int]()
var b_cards = [Int]()
var answer = 0

var b_set = Set<Int>()
for _ in 0..<n {
    b_set.insert(Int(readLine()!)!)
}

for i in 1...2*n {
    if !b_set.contains(i) {
        a_cards.append(i)
    }
}

// 오름차순으로 정렬
a_cards.sort(by: <)
b_cards = Array(b_set)
b_cards.sort(by: <)

var b = 0
for a in 0..<n {
    if b < n, a_cards[a] > b_cards[b] {
        answer += 1
        b += 1
    }
}

print(answer)