/*
 백준 1263 - 좋다
 분류 - 투포인터
 풀이 과정 - 모든 원소에 대해 탐색을 진행하면서 투포인터로 해당 원소를 만들 수 있는지 확인
 시간 복잡도 - O(N^2)
 */

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var cnt = 0

numbers.sort() // 투포인터 접근을 위한 오름차순 정렬

if n <= 2 { // 2개 이하일 경우 조합을 생성할 수 없음
    print(0)
} else {
    for i in 0..<n {
        var left = 0
        var right = n - 1
        
        if i == 0 {
            left = 1
        }
        
        if i == n - 1 {
            right = n - 2
        }
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            
            if sum == numbers[i], left != i, right != i {
                cnt += 1
                break
            } else if sum < numbers[i] {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    print(cnt)
}