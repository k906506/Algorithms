let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var orders = [Int](repeating: 0, count: n)
var cnt = 1

for number in numbers {
    if orders[number] == 0 {
        orders[number] = cnt
    } else { // 해당 위치에 이미 순서가 정해져있으면 다른 위치로 이동
        var idx = number
        
        while idx < n, orders[idx] != 0 {
            idx += 1
        }
        
        orders[idx] = cnt
    }
    
    cnt += 1
}

for order in orders {
    print(order, terminator: " ")
}