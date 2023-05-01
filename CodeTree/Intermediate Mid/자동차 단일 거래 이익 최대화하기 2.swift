let n = Int(readLine()!)!
var prices = readLine()!.split(separator: " ").map { Int(String($0))! }

var minPrice = prices[0]
var answer = 0

for price in prices {
    let profit = price - minPrice // 현재 값 - 지금까지의 최소값

    if answer < profit {
        answer = profit
    }

    if minPrice > price {
        minPrice = price
    }
}

print(answer)