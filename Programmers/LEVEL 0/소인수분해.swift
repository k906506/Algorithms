import Foundation

func solution(_ n:Int) -> [Int] {
    var primes: [Int] = getPrime(n)
    
    return primes.filter { n % $0  == 0 }.sorted()
}


func getPrime(_ n: Int) -> [Int] {
    var numbers: [Int] = [Int](0...n) // 0으로 초기화
    
    for i in 2...numbers.count - 1 {
        numbers[i] = i
    }
    
    for i in 2...numbers.count {
        for j in stride(from: i * i, through: n, by: i) {
            numbers[j] = 1 // 소수가 아니면 1로
        }
    }
    
    return numbers.filter { $0 >= 2 }
}