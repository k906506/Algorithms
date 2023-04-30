// 주어진 동전이 배수 관계에 있으므로, 큰 동전부터 나누기를 진행해도 됨
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var coins = [Int]()

for _ in 0..<inputs[0] {
    coins.append(Int(readLine()!)!)
}

var price = inputs[1]
var cnt = 0

for i in stride(from: inputs[0] - 1, to: -1, by: -1) {
    if price <= 0 { break }

    let mok = price / coins[i]
    cnt += mok
    price -= (mok * coins[i])
}

print(cnt)