import Foundation

var answer = [[Int]]()

func solution(_ n:Int) -> [[Int]] {
    hanoi(n, 1, 2, 3)
    
    return answer
}

func hanoi(_ num: Int, _ start: Int, _ mid: Int, _ end: Int) { // 원판의 개수, 출발, 경우, 도착
    if num == 1 {
        answer.append([start, end])
        return
    }
    
    hanoi(num - 1, start, end, mid) // n-1개를 경유 기둥으로 이동
    hanoi(1, start, mid, end) // 1개(가장 큰 원판)을 도착 기둥으로 이동
    hanoi(num - 1, mid, start, end) // n-1개를 도착 기둥으로 이동
}