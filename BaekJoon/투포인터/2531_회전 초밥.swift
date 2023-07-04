let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var orders = [Int]()
var counts = [Int](repeating: 0, count: inputs[1] + 1) // 이미 먹은 초밥인지를 확인
counts[inputs[3]] -= 1 // 쿠폰 번호가 주어진 초밥

for _ in 0..<inputs[0] {
    orders.append(Int(readLine()!)!)
}

var temp = orders
orders += temp // 배열 연장

var set = Set<Int>()
var right = 0
var gap = 0
var ans = 0

for left in 0..<inputs[0] * 2 {
    while counts[orders[right]] <= 0, gap < inputs[2] {
        counts[orders[right]] += 1
        
        if right < inputs[0] * 2 - 1 {
            if counts[orders[right]] >= 1 {
                gap += 1
            }
            
            set.insert(orders[right])
            right += 1
        }
    }
    
    ans = max(ans, set.count)
    set.remove(orders[left])
    counts[orders[left]] -= 1 // 오른쪽으로 한 칸 이동
    gap -= 1
}

print(ans)